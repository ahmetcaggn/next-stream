// ignore_for_file: public_member_api_docs no need to document for instances.

import 'package:get_it/get_it.dart';
import 'package:next_stream_mobile/product/route/app_routes.dart';

abstract final class G {
  static AppRoutes get appRoutes => GetIt.I.get<AppRoutes>();
}
