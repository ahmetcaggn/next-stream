// ignore_for_file: public_member_api_docs no need to document for route names.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/home/screen_home.dart';
import 'package:next_stream_mobile/feature/home/view_model/cubit_home.dart';
import 'package:next_stream_mobile/feature/upload/screen_upload.dart';
import 'package:next_stream_mobile/feature/upload/view_model/cubit_upload.dart';

/// The manager class for the application routes.
final class AppRoutes {
  static const String home = '/';
  static const String upload = '/upload';

  /// Generates the routes for the application. Uses in the
  /// [MaterialApp.onGenerateRoute] property.
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<CubitHome>(
                create: (_) => CubitHome(),
              ),
            ],
            child: const ScreenHome(),
          ),
        );
      case upload:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<CubitUpload>(
                create: (_) => CubitUpload(),
              ),
            ],
            child: const ScreenUpload(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Not Found'),
            ),
          ),
        );
    }
  }
}
