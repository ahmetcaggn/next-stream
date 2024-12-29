import 'package:image_picker/image_picker.dart';

/// UploadState is a class that contains the state of the upload process.
sealed class StateUpload {
  const StateUpload();
}

/// UploadInitial is a state that represents the initial state of the upload
/// process.
class StateUploadInitial extends StateUpload {
  /// Creates an instance of UploadInitial.
  const StateUploadInitial();
}

/// UploadFilePicked is a state that represents the file that has been picked by
/// the user.
class StateUploadFilePicked extends StateUpload {
  /// Creates an instance of UploadFilePicked.
  const StateUploadFilePicked({
    required this.file,
  });

  /// The file that has been picked by the user.
  final XFile file;
}

/// UploadInProgress is a state that represents the upload process in progress.
class StateUploadInProgress extends StateUpload {
  /// Creates an instance of UploadInProgress.
  const StateUploadInProgress({
    required this.progress,
  });

  /// The progress of the upload process.
  final double progress;
}

/// UploadSuccess is a state that represents the successful completion of the
/// upload process.
class StateUploadSuccess extends StateUpload {
  /// Creates an instance of UploadSuccess.
  const StateUploadSuccess();
}

/// UploadError is a state that represents an error during the upload process.
class StateUploadError extends StateUpload {
  /// Creates an instance of UploadError.
  const StateUploadError({
    required this.message,
  });

  /// The error message will be displayed to the user.
  final String message;
}
