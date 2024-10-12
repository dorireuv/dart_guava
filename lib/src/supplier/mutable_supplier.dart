import 'supplier.dart';

final class MutableSupplier<T> implements Supplier<T> {
  T _v;

  MutableSupplier(this._v);

  @override
  T get() => _v;

  void set(T v) => _v = v;
}
