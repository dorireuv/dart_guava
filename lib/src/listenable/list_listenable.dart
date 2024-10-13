import 'package:built_collection/built_collection.dart';

import 'listenable.dart';

abstract class ListListenable<T> {
  BuiltMap<int, Listenable<T>> allListenables();

  Listenable<T> listenable(int? i);

  Listenable<BuiltList<T>> anyListenable();
}
