import 'package:flutter/material.dart';
import 'package:next_stream_mobile/product/dependency_injection/app_get_it_configurer.dart';
import 'package:next_stream_mobile/product/dependency_injection/get.dart';
import 'package:next_stream_mobile/product/logger/log.dart';

/// Manages the startup process of the application.
abstract final class AppInitializer {
  /// Initializes the application.
  static Future<void> init() async {
    L.initForApp();
    WidgetsFlutterBinding.ensureInitialized();
    await _init();
  }

  static Future<void> _init() async {
    // dependency injection
    AppGetItConfigurer.init();

    // network manager initialization
    await G.networkManager.init();

    L.i('App initialized');
  }
}
