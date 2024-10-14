import 'package:mockito/mockito.dart';

abstract class FakeListCallback<T> {
  void call(int i, T v);
}

class FakeListCallbackMock<T> extends Mock implements FakeListCallback<T> {
  static FakeListCallback<T> create<T>() => FakeListCallbackMock._();

  FakeListCallbackMock._();
}
