import 'callback.dart';
import 'list_listenable.dart';
import 'listenable.dart';
import 'notifier.dart';

class ListNotifier<KEY, T> implements ListListenable<KEY, T> {
  final Map<KEY, Notifier<T>> _notifiers = {};
  final Notifier<void> _anyNotifier = Notifier();
  final Listenable<T> _nullListenable = _NullListenable();

  @override
  Listenable<T> listenable(KEY? key) {
    return key != null ? _notifier(key) : _nullListenable;
  }

  @override
  Listenable<void> anyListenable() => _anyNotifier;

  void notify(KEY key, T v) {
    _anyNotifier.notify(null);
    _notifier(key).notify(v);
  }

  Notifier<T> _notifier(KEY key) =>
      _notifiers.putIfAbsent(key, () => Notifier<T>());
}

class _NullListenable<T> implements Listenable<T> {
  @override
  void addListener(Callback<T> callback) {}

  @override
  void removeListener(Callback<T> callback) {}
}
