import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_ci_test/util/version.dart';

void main() {
  test('version 1.0.0', () {
        expect(
            Version("1.0.0").toString(),
            equals("1.0.0"));
  });

  test('version 1.14.178', () {
    expect(
        Version("1.14.178").toString(),
        equals("1.14.178"));
  });

  test('version 1.0.0-beta', () {
    expect(
        Version("1.0.0-beta").toString(),
        equals("1.0.0-beta"));
  });

  test('version 3.0.100', () {
    expect(
        Version("3.0.100").toString(),
        equals("3.0.100A"));
  });
}