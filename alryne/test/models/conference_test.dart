import 'dart:convert' show json;

import 'package:alryne/models.dart' show Conference, Committee;

import 'package:test/test.dart';

void main() {
  group('constructor', () {
    test('> direct constructor', () {
      expect(
          () => new Conference(
              id: 'ABCD', committee: new Committee(topic: 'EFGI')),
          returnsNormally);
      final Conference conference =
          new Conference(id: 'ABCD', committee: new Committee(topic: 'EFGH'));
      expect(conference.id, equals('ABCD'));
      expect(conference.committee, equals(new Committee(topic: 'EFGH')));
    });
    test('> create constructor', () {
      expect(() => new Conference.create(topic: 'ABCD'), returnsNormally);
      final Conference conference = new Conference.create(topic: 'ABCD');
      for (int codeUnit in conference.id.codeUnits) {
        expect(codeUnit, inInclusiveRange(65, 65 + 25));
      }
      expect(conference.committee, equals(new Committee(topic: 'ABCD')));
    });
  });

  group('serialization', () {
    test('> serializes correctly', () {
      final Conference conference =
          new Conference(id: 'ABCD', committee: new Committee(topic: 'EFGH'));
      final Conference constructedConference =
          new Conference.fromJson(json.decode(json.encode(conference)));
      expect(constructedConference, equals(conference));
    });
  });

  group('generator', () {
    test('> random generator', () {
      for (int i = 0; i < 100; i++) {
        final String id = Conference.generateId();
        for (int codeUnit in id.codeUnits) {
          expect(codeUnit, inInclusiveRange(65, 65 + 25));
        }
      }
    });
  });
}
