import 'list_supplier.dart';

class ListAsListSupplier<T> implements ListSupplier<T> {
  final List<T> _list;

  ListAsListSupplier(Iterable<T> iterable) : _list = iterable.toList();

  @override
  int get size => _list.length;

  @override
  T get(int i) => _list[i];
}
