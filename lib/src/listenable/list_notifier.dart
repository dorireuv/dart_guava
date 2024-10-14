import 'list_callback.dart';
import 'list_listenable.dart';

class ListNotifier<T> implements ListListenable<T> {
  final List<ListCallback<T>> _callbacks = [];

  @override
  void addListener(ListCallback<T> callback) {
    _callbacks.add(callback);
  }

  @override
  void removeListener(ListCallback<T> callback) {
    _callbacks.remove(callback);
  }

  void notify(int i, T v) {
    for (final callback in _callbacks) {
      callback(i, v);
    }
  }
}
