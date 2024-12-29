import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/viewer/argument_viewer.dart';
import 'package:next_stream_mobile/feature/viewer/mixin/mixin_viewer.dart';
import 'package:next_stream_mobile/feature/viewer/view_model/cubit_viewer.dart';
import 'package:next_stream_mobile/feature/viewer/view_model/state_viewer.dart';
import 'package:next_stream_mobile/feature/viewer/widget/viewer_header.dart';
import 'package:next_stream_mobile/feature/viewer/widget/viewer_video_controller.dart';
import 'package:next_stream_mobile/feature/viewer/widget/viewer_video_player.dart';

/// The screen for uploading a video
class ScreenViewer extends StatefulWidget {
  /// Creates instance of [ScreenViewer]
  const ScreenViewer({
    required this.argument,
    super.key,
  });

  /// The argument for the screen
  final ArgumentViewer argument;

  @override
  State<ScreenViewer> createState() => _ScreenViewerState();
}

class _ScreenViewerState extends State<ScreenViewer> with MixinViewer {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: cubit)],
      child: const Scaffold(
        appBar: _Header(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _VideoPlayer(),
              _ControlPanel(),
              _TextSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget implements PreferredSizeWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CubitViewer, StateViewer, String>(
      selector: (state) {
        if (state is StateViewerLoaded) {
          return state.video.title ?? 'No title';
        }
        if (state is StateViewerError) {
          return 'Error';
        }
        return 'Loading';
      },
      builder: (_, title) {
        return ViewerHeader(title: title);
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _VideoPlayer extends StatelessWidget {
  const _VideoPlayer();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitViewer, StateViewer>(
      builder: (_, state) {
        if (state is StateViewerError) {
          return Text(state.message);
        }

        if (state is! StateViewerLoaded) {
          return const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(),
            ),
          );
        }

        return ViewerVideoPlayer(
          videoPlayerController: state.videoPlayerController,
        );
      },
    );
  }
}

class _ControlPanel extends StatelessWidget {
  const _ControlPanel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitViewer, StateViewer>(
      builder: (_, state) {
        if (state is! StateViewerLoaded) {
          return const SizedBox.shrink();
        }

        return ViewerVideoController(
          controller: state.videoPlayerController,
        );
      },
    );
  }
}

class _TextSection extends StatelessWidget {
  const _TextSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitViewer, StateViewer>(
      builder: (_, state) {
        if (state is! StateViewerLoaded) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // to make the column full width
              const Row(),

              Text(
                state.video.title ?? 'No title',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                state.video.description ?? 'No description',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
