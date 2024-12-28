import 'package:next_stream_mobile/product/network/response/model_video.dart';

/// The base class for the state classes of the home screen.
sealed class StateHome {
  /// Creates the state.
  const StateHome();
}

/// The initial state of the home screen.
class StateHomeInitial extends StateHome {
  /// Creates the initial state.
  const StateHomeInitial();
}

/// The state of the home screen when it is loaded.
class StateHomeLoaded extends StateHome {
  /// Creates the loaded state.
  const StateHomeLoaded({
    required this.videos,
  });

  /// The list of videos will be shown in the home screen.
  final List<ModelVideo> videos;
}

/// The state of the home screen when an error occurs.
class StateHomeError extends StateHome {
  /// Creates the error state.
  const StateHomeError({
    required this.message,
  });

  /// The error message will be shown in the home screen.
  final String message;
}
