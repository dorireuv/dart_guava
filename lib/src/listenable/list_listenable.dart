import 'listenable.dart';

abstract class ListListenable<T> {
  Listenable<T> listenable(int? i);

  Listenable<void> anyListenable();
}
