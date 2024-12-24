/// Base state class for upload screen states
abstract class StateUpload {
  /// Data upload
  const StateUpload();
}

/// State upload screen initial
class StateUploadInitial extends StateUpload {
  /// Creates instance of [StateUploadInitial]
  const StateUploadInitial();
}

/// State class for loaded upload screen
class StateUploadLoaded extends StateUpload {
  /// Creates instance of [StateUploadLoaded]
  const StateUploadLoaded();
}
