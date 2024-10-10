import 'package:dart_guava/src/supplier/list_supplier.dart';

import 'constant_supplier.dart';
import 'list_as_list_supplier.dart';
import 'supplier.dart';

final class Suppliers {
  Suppliers._();

  static Supplier<T> constant<T>(T v) => ConstantSupplier(v);

  static ListSupplier<T> list<T>(Iterable<T> iterable) =>
      ListAsListSupplier(iterable);
}
