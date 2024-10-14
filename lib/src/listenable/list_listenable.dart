import 'list_callback.dart';

abstract class ListListenable<T> {
  void addListener(ListCallback<T> callback);

  void removeListener(ListCallback<T> callback);

  void dispose();
}
