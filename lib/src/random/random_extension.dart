import 'dart:math';

import 'package:dart_guava/dart_guava.dart';

extension RandomExtension on Random {
  /// Generates a random int in a given inclusive range [from]-[to].
  /// [to] must be greater than [from].
  int nextIntFromTo(int from, int to) {
    checkArgument(to > from);
    return nextInt(to - from + 1) + from;
  }
}
