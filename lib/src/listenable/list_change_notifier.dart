import 'package:built_collection/built_collection.dart';

import '../supplier/list_supplier.dart';
import '../supplier/supplier.dart';
import 'list_callback.dart';
import 'list_listenable.dart';
import 'list_notifier.dart';

mixin ListChangeNotifier<T>
    on Supplier<BuiltList<T>>, ListSupplier<T>
    implements ListListenable<T> {
  final _notifier = ListNotifier<T>();

  @override
  void addListener(ListCallback<T> c) => _notifier.addListener(c);

  @override
  void removeListener(ListCallback<T> c) => _notifier.removeListener(c);

  V notifyOnChange<V>(int i, V Function(int i) change) {
    final v = change(i);
    _notify(i);
    return v;
  }

  bool notifyIfChanged(int i, bool Function() change) {
    final isChanged = change();
    if (!isChanged) {
      return false;
    }

    _notify(i);
    return true;
  }

  void notifyAll() {
    for (final i in _indices) {
      _notify(i);
    }
  }

  void notifyAllOnChange(void Function() change) {
    change();
    notifyAll();
  }

  V notifyAllIfChanged<V>(V Function() change) {
    final before = get();
    final res = change();
    final after = get();
    for (final i in _indices) {
      if (after[i] != before[i]) {
        _notify(i);
      }
    }

    return res;
  }

  void _notify(int i) {
    _notifier.notify(i, getAt(i));
  }

  Iterable<int> get _indices => Iterable.generate(get().length);
}
