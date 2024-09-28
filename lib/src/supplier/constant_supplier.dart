import 'supplier.dart';

final class ConstantSupplier<T> implements Supplier<T> {
  final T _v;

  ConstantSupplier(this._v);

  @override
  T get() => _v;
}
