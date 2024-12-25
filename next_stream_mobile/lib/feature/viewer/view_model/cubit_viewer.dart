import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/viewer/view_model/state_viewer.dart';

/// The cubit for the Viewer screen
class CubitViewer extends Cubit<StateViewer> {
  /// Creates instance of [CubitViewer]
  CubitViewer() : super(const StateViewerInitial());
}
