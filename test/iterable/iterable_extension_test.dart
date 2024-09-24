import 'package:dart_guava/dart_guava.dart';
import 'package:test/test.dart';

void main() {
  group('indicesWhere', () {
    bool containsA(String s) => s.contains('a') || s.contains('A');

    test('no matches -> empty', () {
      expect(['b', 'c'].indicesWhere(containsA).toList(), []);
    });

    test('single match -> single index', () {
      expect(['a', 'c'].indicesWhere(containsA).toList(), [0]);
      expect(['b', 'a'].indicesWhere(containsA).toList(), [1]);
    });

    test('multiple matches -> multiple indices', () {
      expect(['a', 'b', 'c', 'ca'].indicesWhere(containsA).toList(), [0, 3]);
      expect(['a', 'ab', 'ac'].indicesWhere(containsA).toList(), [0, 1, 2]);
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
