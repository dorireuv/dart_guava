import 'constant_supplier.dart';
import 'supplier.dart';

final class Suppliers {
  Suppliers._();

  static Supplier<T> constant<T>(T v) => ConstantSupplier(v);
}
