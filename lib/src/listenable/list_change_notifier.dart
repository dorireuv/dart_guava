import '../supplier/list_supplier.dart';
import 'list_listenable.dart';
import 'list_notifier.dart';
import 'listenable.dart';

mixin ListChangeNotifier<T> on ListSupplier<T> implements ListListenable<T> {
  final _notifier = ListNotifier<T>();

  @override
  Listenable<T> listenable(int? i) => _notifier.listenable(i);

  @override
  Listenable<void> anyListenable() => _notifier.anyListenable();

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

  void notifyAny(void Function() change) {
    change();
    _notifier.notifyAny();
  }
}
