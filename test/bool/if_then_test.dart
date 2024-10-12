import 'package:dart_guava/dart_guava.dart';
import 'package:test/test.dart';

void main() {
  late MutableSupplier<bool> v;

  setUp(() {
    v = Suppliers.mutable(false);
  });

  void set() => v.set(true);
  bool isSet() => v.get() == true;

  void expectSet() => expect(isSet(), isTrue);
  void expectNotSet() => expect(isSet(), isFalse);

  group('ifThen', () {
    test('true -> invokes callback', () {
      true.ifThen(set);
      expectSet();
    });

    test('false -> does not invokes callback', () {
      false.ifThen(set);
      expectNotSet();
    });
  });

  group('ifNotThen', () {
    test('false -> invokes callback', () {
      false.ifNotThen(set);
      expectSet();
    });

    test('true -> does not invokes callback', () {
      true.ifNotThen(set);
      expectNotSet();
    });
  });
}
