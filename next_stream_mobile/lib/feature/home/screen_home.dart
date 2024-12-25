import 'package:flutter/material.dart';
import 'package:next_stream_mobile/feature/home/mixin/home_mixin.dart';
import 'package:next_stream_mobile/feature/home/widget/home_header.dart';

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
    return Scaffold(
      appBar: HomeHeader(
        onUploadPressed: onUploadPressed,
      ),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
