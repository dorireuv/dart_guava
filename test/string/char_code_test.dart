import 'package:dart_guava/dart_guava.dart';
import 'package:test/test.dart';

void main() {
  group('isDigit', () {
    test('digit -> true', () {
      expect(CharCodes.isDigit('0'.codeUnitAt(0)), isTrue);
      expect(CharCodes.isDigit('1'.codeUnitAt(0)), isTrue);
      expect(CharCodes.isDigit('2'.codeUnitAt(0)), isTrue);
      expect(CharCodes.isDigit('3'.codeUnitAt(0)), isTrue);
      expect(CharCodes.isDigit('4'.codeUnitAt(0)), isTrue);
      expect(CharCodes.isDigit('5'.codeUnitAt(0)), isTrue);
      expect(CharCodes.isDigit('6'.codeUnitAt(0)), isTrue);
      expect(CharCodes.isDigit('7'.codeUnitAt(0)), isTrue);
      expect(CharCodes.isDigit('8'.codeUnitAt(0)), isTrue);
      expect(CharCodes.isDigit('9'.codeUnitAt(0)), isTrue);
    });

    test('non-digit -> false', () {
      expect(CharCodes.isDigit('a'.codeUnitAt(0)), isFalse);
      expect(CharCodes.isDigit(CharCodes.cr), isFalse);
      expect(CharCodes.isDigit(CharCodes.space), isFalse);
    });
  });
}
