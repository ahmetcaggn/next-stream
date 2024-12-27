import 'package:flutter/material.dart';
import 'package:next_stream_mobile/product/dependency_injection/app_get_it_configurer.dart';
import 'package:next_stream_mobile/product/dependency_injection/get.dart';

/// Manages the startup process of the application.
abstract final class AppInitializer {
  /// Initializes the application.
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _init();
  }

  static Future<void> _init() async {
    AppGetItConfigurer.init();

    await G.networkManager.init();
  }
}
