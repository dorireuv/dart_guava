import 'package:dart_guava/dart_guava.dart';
import 'package:test/test.dart';

void main() {
  test('closed', () {
    final range = IntRange.closed(-3, 3);

    expect(range.toString(), '[-3, 3]');

    expect(range.min, -3);
    expect(range.max, 3);

    expect(range.isIn(-4), isFalse);
    expect(range.isIn(-3), isTrue);
    expect(range.isIn(-2), isTrue);
    expect(range.isIn(0), isTrue);
    expect(range.isIn(2), isTrue);
    expect(range.isIn(3), isTrue);
    expect(range.isIn(4), isFalse);
  });

  test('open', () {
    final range = IntRange.open(-3, 3);

    expect(range.toString(), '(-3, 3)');

    expect(range.min, -2);
    expect(range.max, 2);

    expect(range.isIn(-4), isFalse);
    expect(range.isIn(-3), isFalse);
    expect(range.isIn(-2), isTrue);
    expect(range.isIn(0), isTrue);
    expect(range.isIn(2), isTrue);
    expect(range.isIn(3), isFalse);
    expect(range.isIn(4), isFalse);
  });

  test('openClosed', () {
    final range = IntRange.openClosed(-3, 3);

    expect(range.toString(), '(-3, 3]');

    expect(range.min, -2);
    expect(range.max, 3);

    expect(range.isIn(-4), isFalse);
    expect(range.isIn(-3), isFalse);
    expect(range.isIn(-2), isTrue);
    expect(range.isIn(0), isTrue);
    expect(range.isIn(2), isTrue);
    expect(range.isIn(3), isTrue);
    expect(range.isIn(4), isFalse);
  });

  test('closedOpen', () {
    final range = IntRange.closedOpen(-3, 3);

    expect(range.toString(), '[-3, 3)');

    expect(range.min, -3);
    expect(range.max, 2);

    expect(range.isIn(-4), isFalse);
    expect(range.isIn(-3), isTrue);
    expect(range.isIn(-2), isTrue);
    expect(range.isIn(0), isTrue);
    expect(range.isIn(2), isTrue);
    expect(range.isIn(3), isFalse);
    expect(range.isIn(4), isFalse);
  });

  test('lowerThan', () {
    final range = IntRange.lowerThan(3);

    expect(range.toString(), '<3');

    expect(range.min, IntRange.lowest);
    expect(range.max, 2);

    expect(range.isIn(IntRange.lowest), isTrue);
    expect(range.isIn(3), isFalse);
    expect(range.isIn(4), isFalse);
  });

  test('lowerThanOrEqualTo', () {
    final range = IntRange.lowerThanOrEqualTo(3);

    expect(range.toString(), '<=3');

    expect(range.min, IntRange.lowest);
    expect(range.max, 3);

    expect(range.isIn(IntRange.lowest), isTrue);
    expect(range.isIn(3), isTrue);
    expect(range.isIn(4), isFalse);
  });

  test('greaterThan', () {
    final range = IntRange.greaterThan(3);

    expect(range.toString(), '>3');

    expect(range.min, 4);
    expect(range.max, IntRange.highest);

    expect(range.isIn(2), isFalse);
    expect(range.isIn(3), isFalse);
    expect(range.isIn(IntRange.highest), isTrue);
  });

  test('greaterThanOrEqualTo', () {
    final range = IntRange.greaterThanOrEqualTo(3);

    expect(range.toString(), '>=3');

    expect(range.min, 3);
    expect(range.max, IntRange.highest);

    expect(range.isIn(2), isFalse);
    expect(range.isIn(3), isTrue);
    expect(range.isIn(IntRange.highest), isTrue);
  });

  test('any', () {
    final range = IntRange.any();

    expect(range.toString(), 'any');

    expect(range.min, IntRange.lowest);
    expect(range.max, IntRange.highest);

    expect(range.isIn(IntRange.lowest), isTrue);
    expect(range.isIn(0), isTrue);
    expect(range.isIn(IntRange.highest), isTrue);
  });

  test('isNotIn', () {
    final range = IntRange.closed(-3, 3);

    expect(range.toString(), '[-3, 3]');

    expect(range.min, -3);
    expect(range.max, 3);

    expect(range.isNotIn(-4), isTrue);
    expect(range.isNotIn(-3), isFalse);
    expect(range.isNotIn(-2), isFalse);
    expect(range.isNotIn(0), isFalse);
    expect(range.isNotIn(2), isFalse);
    expect(range.isNotIn(3), isFalse);
    expect(range.isNotIn(4), isTrue);
  });
}
