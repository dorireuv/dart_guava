import '../supplier/supplier.dart';
import 'callback.dart';
import 'listenable.dart';
import 'notifier.dart';

mixin ChangeNotifier<T> on Supplier<T> implements Listenable<T> {
  final _notifier = Notifier<T>();

  @override
  void addListener(Callback<T> c) => _notifier.addListener(c);

  @override
  void removeListener(Callback<T> c) => _notifier.removeListener(c);

  @override
  void dispose() => _notifier.dispose();

  V notify<V>(V Function() change) {
    final v = change();
    _notify();
    return v;
  }

  V notifyAlways<V>(V Function() change) {
    try {
      return change();
    } catch (_) {
      rethrow;
    } finally {
      _notify();
    }
  }

  void notifyCheckIfChanged(void Function() change) {
    final before = get();
    change();
    final after = get();
    if (after == before) {
      return;
    }

    _notifier.notify(after);
  }

  bool notifyIfChanged(bool Function() change) {
    final isChanged = change();
    if (!isChanged) {
      return false;
    }

    _notify();
    return true;
  }

  void _notify() {
    _notifier.notify(get());
  }
}
