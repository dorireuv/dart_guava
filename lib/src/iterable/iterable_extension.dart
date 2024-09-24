extension IterableExtension<T> on Iterable<T> {
  Iterable<int> indicesWhere(bool Function(T element) test) sync* {
    var index = 0;
    for (var element in this) {
      if (test(element)) yield index;
      index++;
    }
  }
}
