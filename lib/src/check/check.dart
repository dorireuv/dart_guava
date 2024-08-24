void checkArgument(bool isValid, [String message = '']) {
  if (!isValid) {
    throw ArgumentError(message);
  }
}

void checkState(bool isValid, [String message = '']) {
  if (!isValid) {
    throw StateError(message);
  }
}
