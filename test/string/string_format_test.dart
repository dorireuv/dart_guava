import 'package:dart_guava/dart_guava.dart';
import 'package:test/test.dart';

void main() {
  test('no params -> original string', () {
    expect('foo %1\$s'.format(null), 'foo %1\$s');
  });

  test('single param single token -> replaces', () {
    expect('foo %1\$s'.format(['bar']), 'foo bar');
  });

  test('single param multiple tokens -> replaces', () {
    expect('foo %1\$s1 %1\$s2'.format(['bar']), 'foo bar1 bar2');
  });

  test('multiple params single token -> replaces', () {
    expect('foo %1\$s %2\$s'.format(['bar1', 'bar2']), 'foo bar1 bar2');
  });

  test('multiple params multiple tokens -> replaces', () {
    expect('foo 1%1\$s 2%2\$s 3%1\$s 4%2\$s'.format(['bar1', 'bar2']),
        'foo 1bar1 2bar2 3bar1 4bar2');
  });
}
