import 'package:dart_guava/dart_guava.dart';
import 'package:test/test.dart';

void main() {
  group('checkArgument', () {
    test('true -> does not throw', () {
      expect(() => checkArgument(true), returnsNormally);
    });

    test('false -> throws', () {
      expect(() => checkArgument(false), throwsArgumentError);
    });
  });

  group('checkState', () {
    test('true -> does not throw', () {
      expect(() => checkState(true), returnsNormally);
    });

    test('false -> throws', () {
      expect(() => checkState(false), throwsStateError);
    });
  });
}
