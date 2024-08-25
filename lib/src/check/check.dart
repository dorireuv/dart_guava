/// Throws [ArgumentError] with [message] iff the given [isValid] is [False].
void checkArgument(bool isValid, [String message = '']) {
  if (!isValid) {
    throw ArgumentError(message);
  }
}

/// Throws [StateError] with [message] iff the given [isValid] is [False].
void checkState(bool isValid, [String message = '']) {
  if (!isValid) {
    throw StateError(message);
  }
}
