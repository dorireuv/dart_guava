extension StringFormatExtension on String {
  /// Allows simple string interpolation.
  ///
  /// For every param i in [params], replaces %i$s with the param value.
  String format(List<Object>? params) {
    if (params == null) {
      return this;
    }

    String result = this;
    for (int i = 0; i < params.length; i++) {
      result = result.replaceAll('%${i + 1}\$s', params[i].toString());
    }

    return result;
  }
}
