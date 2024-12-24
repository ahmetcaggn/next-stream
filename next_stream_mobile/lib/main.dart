import 'package:flutter/material.dart';
import 'package:next_stream_mobile/product/dependency_injection/get.dart';
import 'package:next_stream_mobile/product/init/app_initializer.dart';

void main() async {
  await AppInitializer.init();
  runApp(const App());
}

/// The root widget of the application
class App extends StatelessWidget {
  /// Creates the application.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      onGenerateRoute: G.appRoutes.onGenerateRoute,
    );
  }
}
