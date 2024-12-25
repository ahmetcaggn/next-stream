/// Base state class for Viewer screen states
abstract class StateViewer {
  /// Data Viewer
  const StateViewer();
}

/// State Viewer screen initial
class StateViewerInitial extends StateViewer {
  /// Creates instance of [StateViewerInitial]
  const StateViewerInitial();
}

/// State class for loaded Viewer screen
class StateViewerLoaded extends StateViewer {
  /// Creates instance of [StateViewerLoaded]
  const StateViewerLoaded();
}
