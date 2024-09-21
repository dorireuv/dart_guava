import 'package:dart_guava/dart_guava.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'fake_callback.dart';

void main() {
  late ListNotifier<int, Object> notifier;
  late ListListenable<int, Object> listenable;

  setUp(() {
    notifier = ListNotifier<int, Object>();
    listenable = notifier;
  });

  group('notify', () {
    test('no listeners returns normally', () {
      expect(() => notifier.notify(0, 'foo'), returnsNormally);
    });

    test('single listener notifies', () {
      final callback1 = FakeModelChangeCallbackMock();
      final callback2 = FakeModelChangeCallbackMock();
      final anyCallback = FakeModelChangeCallbackMock();
      listenable.listenable(1).addListener(callback1);
      listenable.listenable(2).addListener(callback2);
      listenable.anyListenable().addListener(anyCallback);

      notifier.notify(1, 'foo');

      verify(callback1('foo')).called(1);
      verifyNever(callback2('foo'));
      verify(anyCallback(null)).called(1);
    });

    test('multiple listeners notifies', () {
      final callback11 = FakeModelChangeCallbackMock();
      final callback12 = FakeModelChangeCallbackMock();
      final callback21 = FakeModelChangeCallbackMock();
      final callback22 = FakeModelChangeCallbackMock();
      final anyCallback = FakeModelChangeCallbackMock();
      listenable.listenable(1).addListener(callback11);
      listenable.listenable(1).addListener(callback12);
      listenable.listenable(2).addListener(callback21);
      listenable.listenable(2).addListener(callback22);
      listenable.anyListenable().addListener(anyCallback);

      notifier.notify(1, 'foo');

      verify(callback11('foo')).called(1);
      verify(callback12('foo')).called(1);
      verifyNever(callback21('foo'));
      verifyNever(callback22('foo'));
      verify(anyCallback(null)).called(1);
    });

    test('null key ignores', () {
      final callback = FakeModelChangeCallbackMock();
      final anyCallback = FakeModelChangeCallbackMock();
      listenable.listenable(null).addListener(callback);
      listenable.anyListenable().addListener(anyCallback);

      notifier.notify(1, 'foo');

      verifyNever(callback('foo'));
      verify(anyCallback(null)).called(1);
    });
  });

  group('notifyAny', () {
    test('no listeners returns normally', () {
      expect(() => notifier.notifyAny(), returnsNormally);
    });

    test('single listener notifies', () {
      final callback = FakeModelChangeCallbackMock();
      final anyCallback = FakeModelChangeCallbackMock();
      listenable.listenable(1).addListener(callback);
      listenable.anyListenable().addListener(anyCallback);

      notifier.notifyAny();

      verifyNever(callback(null));
      verify(anyCallback(null)).called(1);
    });

    test('multiple listeners notifies', () {
      final callback = FakeModelChangeCallbackMock();
      final anyCallback1 = FakeModelChangeCallbackMock();
      final anyCallback2 = FakeModelChangeCallbackMock();
      listenable.listenable(1).addListener(callback);
      listenable.anyListenable().addListener(anyCallback1);
      listenable.anyListenable().addListener(anyCallback2);

      notifier.notifyAny();

      verifyNever(callback(null));
      verify(anyCallback1(null)).called(1);
      verify(anyCallback2(null)).called(1);
    });
  });
}
