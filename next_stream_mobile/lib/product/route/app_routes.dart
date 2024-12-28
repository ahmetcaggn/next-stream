// ignore_for_file: public_member_api_docs no need to document for route names.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/home/screen_home.dart';
import 'package:next_stream_mobile/feature/home/view_model/cubit_home.dart';
import 'package:next_stream_mobile/feature/viewer/screen_upload.dart';
import 'package:next_stream_mobile/feature/viewer/view_model/cubit_viewer.dart';
import 'package:next_stream_mobile/product/logger/log.dart';

/// The manager class for the application routes.
final class AppRoutes {
  static const String home = '/';
  static const String viewer = '/upload';

  /// Generates the routes for the application. Uses in the
  /// [MaterialApp.onGenerateRoute] property.
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    L.d('Route: ${settings.name}');

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
      case viewer:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<CubitViewer>(
                create: (_) => CubitViewer(),
              ),
            ],
            child: const ScreenViewer(),
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
