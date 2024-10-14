import 'package:dart_guava/dart_guava.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'fake_list_callback.dart';

void main() {
  late ListNotifier<Object> notifier;
  late ListListenable<Object> listenable;

  setUp(() {
    notifier = ListNotifier<Object>();
    listenable = notifier;
  });

  group('notify', () {
    test('no listeners returns normally', () {
      expect(() => notifier.notify(0, 'foo'), returnsNormally);
    });

    test('single listener notifies', () {
      final callback = FakeListCallbackMock.create();
      listenable.addListener(callback);

      notifier.notify(1, 'foo');

      verify(callback(1, 'foo')).called(1);
    });

    test('multiple listeners notifies', () {
      final callback1 = FakeListCallbackMock.create();
      final callback2 = FakeListCallbackMock.create();
      listenable.addListener(callback1);
      listenable.addListener(callback2);

      notifier.notify(1, 'foo');

      verify(callback1(1, 'foo')).called(1);
      verify(callback2(1, 'foo')).called(1);
    });
  });
}
