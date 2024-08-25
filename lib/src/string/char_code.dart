final class CharCodes {
  const CharCodes._();

  /// Control (non printable) characters.
  static const bs = 0x08;
  static const lf = 0x0A;
  static const cr = 0x0D;
  static const esc = 0x1B;
  static const del = 0x7F;

  /// Printable characters.
  static const space = 0x20;
  static const zero = 0x30;
  static const nine = 0x39;

  static bool isControlCharacter(int charCode) =>
      charCode < space || charCode == del;

  static bool isPrintable(int charCode) => !isControlCharacter(charCode);

  static bool isDigit(int charCode) => charCode >= zero && charCode <= nine;
}
