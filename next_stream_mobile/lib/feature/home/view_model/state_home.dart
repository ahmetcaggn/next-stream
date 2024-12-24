/// The base class for the state classes of the home screen.
abstract class StateHome {
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
  const StateHomeLoaded();
}
