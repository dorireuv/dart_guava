import 'package:mockito/mockito.dart';

abstract class FakeModelChangeCallback<T> {
  void call(T v);
}

class FakeModelChangeCallbackMock<T> extends Mock
    implements FakeModelChangeCallback<T> {}
