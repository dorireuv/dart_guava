import 'list_callback.dart';
import 'list_listenable.dart';

class ListNotifier<T> implements ListListenable<T> {
  final List<ListCallback<T>> _callbacks = [];

  @override
  void addListener(ListCallback<T> c) => _callbacks.add(c);

  @override
  void removeListener(ListCallback<T> c) => _callbacks.remove(c);

  @override
  void dispose() {
    _callbacks.clear();
  }

  void notify(int i, T v) {
    for (final callback in _callbacks) {
      callback(i, v);
    }
  }
}
