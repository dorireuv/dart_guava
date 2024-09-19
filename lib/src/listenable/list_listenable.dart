import 'listenable.dart';

abstract class ListListenable<KEY, T> {
  Listenable<T> listenable(KEY? key);

  Listenable<void> anyListenable();
}
