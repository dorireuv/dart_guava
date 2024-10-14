import 'callback.dart';

abstract class Listenable<T> {
  void addListener(Callback<T> callback);

  void removeListener(Callback<T> callback);

  void dispose();
}
