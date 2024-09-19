import 'callback.dart';
import 'listenable.dart';

class Notifier<T> implements Listenable<T> {
  final List<Callback<T>> _callbacks = [];

  @override
  void addListener(Callback<T> callback) {
    _callbacks.add(callback);
  }

  @override
  void removeListener(Callback<T> callback) {
    _callbacks.remove(callback);
  }

  void notify(T v) {
    for (final callback in _callbacks) {
      callback(v);
    }
  }
}
