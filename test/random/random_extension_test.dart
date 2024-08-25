import 'dart:math';

import 'package:dart_guava/dart_guava.dart';
import 'package:test/test.dart';

void main() {
  final random = Random(0);

  group('nextIntFromTo', () {
    test('to < from -> throws ArgumentError', () {
      expect(() => random.nextIntFromTo(0, -1), throwsArgumentError);
    });

    test('to == from -> throws ArgumentError', () {
      expect(() => random.nextIntFromTo(0, 0), throwsArgumentError);
    });

    test('to > from -> returns random', () {
      expect(() => random.nextIntFromTo(0, 1), returnsNormally);
    });
  });
}
