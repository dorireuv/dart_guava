final class IntRange {
  static const lowest = -0x8000000000000000;
  static const highest = 0x7FFFFFFFFFFFFFFF;

  static IntRange open(int from, int to) {
    return IntRange._(_IntCut.open(from), _IntCut.open(to));
  }

  static IntRange openClosed(int from, int to) {
    return IntRange._(_IntCut.open(from), _IntCut.closed(to));
  }

  static IntRange closed(int from, int to) {
    return IntRange._(_IntCut.closed(from), _IntCut.closed(to));
  }

  static IntRange closedOpen(int from, int to) {
    return IntRange._(_IntCut.closed(from), _IntCut.open(to));
  }

  static IntRange lowerThan(int to) {
    return closedOpen(lowest, to);
  }

  static IntRange lowerThanOrEqualTo(int to) {
    return closed(lowest, to);
  }

  static IntRange greaterThan(int from) {
    return openClosed(from, highest);
  }

  static IntRange greaterThanOrEqualTo(int from) {
    return closed(from, highest);
  }

  static IntRange any() {
    return closed(lowest, highest);
  }

  final _IntCut _from;
  final _IntCut _to;

  const IntRange._(this._from, this._to);

  int get min => _from.min;

  int get max => _to.max;

  bool isIn(int v) => v >= min && v <= max;

  @override
  String toString() {
    if (_from.value == lowest && _to.value == highest) {
      return 'any';
    } else if (_from.value == lowest) {
      return '${_to.openClosed.lowerThan}${_to.value}';
    } else if (_to.value == highest) {
      return '${_from.openClosed.higherThan}${_from.value}';
    } else {
      return '${_from.openClosed.low}${_from.value}, ${_to.value}${_to.openClosed.high}';
    }
  }
}

abstract class _IntCut {
  static _IntCut closed(int v) => _ClosedCut(v);
  static _IntCut open(int v) => _OpenCut(v);

  final int value;

  const _IntCut(this.value);

  _OpenClosed get openClosed;

  int get min;

  int get max;
}

final class _ClosedCut extends _IntCut {
  const _ClosedCut(super.value);

  @override
  _OpenClosed get openClosed => _OpenClosed.closed;

  @override
  int get min => value;

  @override
  int get max => value;
}

final class _OpenCut extends _IntCut {
  const _OpenCut(super.value);

  @override
  _OpenClosed get openClosed => _OpenClosed.open;

  @override
  int get min => value + 1;

  @override
  int get max => value - 1;
}

enum _OpenClosed {
  open('(', '<', ')', '>'),
  closed('[', '<=', ']', '>='),
  ;

  final String low;
  final String lowerThan;
  final String high;
  final String higherThan;

  const _OpenClosed(this.low, this.lowerThan, this.high, this.higherThan);
}
