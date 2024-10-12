import 'constant_supplier.dart';
import 'list_as_list_supplier.dart';
import 'list_supplier.dart';
import 'mutable_supplier.dart';
import 'supplier.dart';

final class Suppliers {
  Suppliers._();

  static Supplier<T> constant<T>(T v) => ConstantSupplier(v);

  static MutableSupplier<T> mutable<T>(T v) => MutableSupplier(v);

  static ListSupplier<T> list<T>(Iterable<T> iterable) =>
      ListAsListSupplier(iterable);
}
