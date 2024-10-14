import 'package:built_collection/built_collection.dart';

import '../supplier/list_supplier.dart';
import '../supplier/supplier.dart';
import 'callback.dart';
import 'list_listenable.dart';
import 'list_notifier.dart';
import 'listenable.dart';

mixin ListChangeNotifier<T>
    on Supplier<BuiltList<T>>, ListSupplier<T>
    implements Listenable<BuiltList<T>>, ListListenable<T> {
  final _notifier = ListNotifier<T>();

  @override
  void addListener(Callback<BuiltList<T>> f) => anyListenable().addListener(f);

  @override
  void removeListener(Callback<BuiltList<T>> f) =>
      anyListenable().removeListener(f);

  @override
  BuiltMap<int, Listenable<T>> allListenables() => _notifier.allListenables();

  @override
  Listenable<T> listenable(int? i) => _notifier.listenable(i);

  @override
  Listenable<BuiltList<T>> anyListenable() => _notifier.anyListenable();

  V notifyOnChange<V>(int i, V Function(int i) change) {
    final v = change(i);
    notify(i);
    return v;
  }

  bool notifyIfChanged(int i, bool Function() change) {
    final isChanged = change();
    if (!isChanged) {
      return false;
    }

    notify(i);
    return true;
  }

  void notify(int i) {
    _notifier.notify(i, getAt(i));
  }

  void notifyAll() {
    for (final i in allListenables().keys) {
      notify(i);
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
    for (final i in allListenables().keys) {
      if (after[i] != before[i]) {
        notify(i);
      }
    }

    return res;
  }

  bool notifyAnyIfChanged(bool Function() change) {
    final isChanged = change();
    if (!isChanged) {
      return false;
    }

    _notifier.notifyAny(get());
    return true;
  }
}
