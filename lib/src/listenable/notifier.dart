import 'callback.dart';
import 'listenable.dart';

class Notifier<T> implements Listenable<T> {
  final List<Callback<T>> _callbacks = [];

  @override
  void addListener(Callback<T> c) => _callbacks.add(c);

  @override
  void removeListener(Callback<T> c) => _callbacks.remove(c);

  @override
  void dispose() => _callbacks.clear();

  void notify(T v) {
    for (final callback in _callbacks) {
      callback(v);
    }
  }
}
