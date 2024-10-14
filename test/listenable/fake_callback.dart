import 'package:mockito/mockito.dart';

abstract class FakeCallback<T> {
  void call(T v);
}

class FakeCallbackMock<T> extends Mock implements FakeCallback<T> {
  static FakeCallback<T> create<T>() => FakeCallbackMock._();

  FakeCallbackMock._();
}
