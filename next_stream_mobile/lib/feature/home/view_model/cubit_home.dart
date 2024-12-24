import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/home/view_model/state_home.dart';

/// The business logic component for the home screen.
class CubitHome extends Cubit<StateHome> {
  /// Creates the CubitHome instance.
  CubitHome() : super(const StateHomeInitial());
}
