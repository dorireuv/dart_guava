import 'package:built_collection/built_collection.dart';

import 'callback.dart';
import 'list_listenable.dart';
import 'listenable.dart';
import 'notifier.dart';

class ListNotifier<T> implements ListListenable<T> {
  final Map<int, Notifier<T>> _notifiers = {};
  final Notifier<void> _anyNotifier = Notifier();
  final Listenable<T> _nullListenable = _NullListenable();

  @override
  BuiltMap<int, Listenable<T>> allListenables() => _notifiers.build();

  @override
  Listenable<T> listenable(int? i) {
    return i != null ? _notifier(i) : _nullListenable;
  }

  @override
  Listenable<void> anyListenable() => _anyNotifier;

  void notify(int i, T v) {
    _notifier(i).notify(v);
    notifyAny();
  }

  void notifyAll() {}

  void notifyAny() => _anyNotifier.notify(null);

  Notifier<T> _notifier(int i) =>
      _notifiers.putIfAbsent(i, () => Notifier<T>());
}

class _NullListenable<T> implements Listenable<T> {
  @override
  void addListener(Callback<T> callback) {}

  @override
  void removeListener(Callback<T> callback) {}
}
