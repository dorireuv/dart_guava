import 'list_supplier.dart';

class ListAsListSupplier<T> implements ListSupplier<T> {
  final List<T> _list;

  ListAsListSupplier(Iterable<T> iterable) : _list = iterable.toList();

  @override
  T getAt(int i) => _list[i];
}
