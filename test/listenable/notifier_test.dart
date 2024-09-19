import 'package:dart_guava/dart_guava.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'fake_callback.dart';

void main() {
  late Notifier<Object> notifier;
  late Listenable<Object> listenable;

  setUp(() {
    notifier = Notifier<Object>();
    listenable = notifier;
  });

  group('notify', () {
    test('no listeners returns normally', () {
      expect(() => notifier.notify('foo'), returnsNormally);
    });

    test('single listener notifies', () {
      final callback = FakeModelChangeCallbackMock();
      listenable.addListener(callback);

      notifier.notify('foo');

      verify(callback('foo')).called(1);
    });

    test('multiple listeners notifies', () {
      final callback1 = FakeModelChangeCallbackMock();
      final callback2 = FakeModelChangeCallbackMock();
      listenable.addListener(callback1);
      listenable.addListener(callback2);

      notifier.notify('foo');

      verify(callback1('foo')).called(1);
      verify(callback2('foo')).called(1);
    });
  });
}
