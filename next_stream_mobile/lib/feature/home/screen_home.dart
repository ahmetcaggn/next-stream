import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/home/mixin/home_mixin.dart';
import 'package:next_stream_mobile/feature/home/view_model/cubit_home.dart';
import 'package:next_stream_mobile/feature/home/view_model/state_home.dart';
import 'package:next_stream_mobile/feature/home/widget/home_header.dart';
import 'package:next_stream_mobile/feature/home/widget/home_video_list.dart';

/// The home screen of the application.
class ScreenHome extends StatefulWidget {
  /// Creates the home screen.
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => cubit),
      ],
      child: Scaffold(
        appBar: HomeHeader(
          onUploadPressed: onUploadPressed,
        ),
        body: Column(
          children: [
            Expanded(
              child: _VideoList(
                onVideoPressed: onVideoPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoList extends StatelessWidget {
  const _VideoList({
    required this.onVideoPressed,
  });

  final OnVideoPressed onVideoPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitHome, StateHome>(
      builder: (_, state) {
        if (state is StateHomeInitial) {
          return const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is StateHomeError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        }

        if (state is! StateHomeLoaded) {
          return Center(
            child: Text(
              'Unknown state',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        }

        return HomeVideoList(
          videos: state.videos,
          onVideoPressed: onVideoPressed,
        );
      },
    );
  }
}
