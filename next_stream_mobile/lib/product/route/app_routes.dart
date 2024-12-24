// ignore_for_file: public_member_api_docs no need to document for route names.

import 'package:flutter/material.dart';
import 'package:next_stream_mobile/feature/home/screen_home.dart';

/// The manager class for the application routes.
final class AppRoutes {
  static const String home = '/';

  /// Generates the routes for the application. Uses in the
  /// [MaterialApp.onGenerateRoute] property.
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const ScreenHome(),
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
