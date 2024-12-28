import 'package:get_it/get_it.dart';
import 'package:next_stream_mobile/product/logger/log.dart';
import 'package:next_stream_mobile/product/network/core/i_network_manager.dart';
import 'package:next_stream_mobile/product/network/core/network_manager.dart';
import 'package:next_stream_mobile/product/route/app_routes.dart';

/// Configures the [GetIt] instance for the application.
abstract final class AppGetItConfigurer {
  /// Initializes the singleton instance of the [GetIt] class.
  static void init() {
    GetIt.I
      ..registerSingleton<AppRoutes>(AppRoutes())
      ..registerSingleton<INetworkManager>(NetworkManager());

    L.i('GetIt configured');
  }
}
