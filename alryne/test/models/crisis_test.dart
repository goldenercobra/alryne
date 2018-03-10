import 'dart:convert' show json;

import 'package:alryne/models.dart' show Crisis;

import 'package:test/test.dart';

void main() {
  group('constructor', () {
    test('> runs correctly', () {
      expect(() => new Crisis(topic: 'test'), returnsNormally);
      final Crisis crisis = new Crisis(topic: 'test');
      expect(crisis.topic, equals('test'));
    });
  });

  group('serialization', () {
    test('> serializes correctly', () {
      final Crisis crisis = new Crisis(topic: 'test');
      final Crisis constructedCrisis =
          new Crisis.fromJson(json.decode(json.encode(crisis)));
      expect(constructedCrisis, equals(crisis));
    });
  });
}
