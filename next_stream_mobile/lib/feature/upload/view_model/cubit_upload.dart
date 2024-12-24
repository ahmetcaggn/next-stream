import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/upload/view_model/state_upload.dart';

/// The cubit for the upload screen
class CubitUpload extends Cubit<StateUpload> {
  /// Creates instance of [CubitUpload]
  CubitUpload() : super(const StateUploadInitial());
}
