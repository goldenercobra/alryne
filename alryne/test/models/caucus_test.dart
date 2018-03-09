import 'dart:convert';

import 'package:test/test.dart';

import 'package:alryne/models.dart';

void main() {
  group('constructor', () {
    test('moderated', () {
      final ModeratedCaucus caucus = new ModeratedCaucus(topic: 'test', length: 100, speakingLength: 10);
      expect(caucus.topic, equals('test'));
      expect(caucus.length, equals(100));
      expect(caucus.speakingLength, equals(10));
      expect(caucus.speakersSize, equals(10));

      expect(new ModeratedCaucus(topic: 'test2', length: 100, speakingLength: 75), throwsArgumentError);
    });
    test('unmoderated', () {
      final UnmoderatedCaucus caucus = new UnmoderatedCaucus(topic: 'test', length: 600);
      expect(caucus.topic, equals('test'));
      expect(caucus.length, equals(600));
    });
    test('other', () {
      final UnmoderatedCaucus caucus = new UnmoderatedCaucus(topic: 'test', length: 1200);
      expect(caucus.topic, equals('test'));
      expect(caucus.length, equals(1200));
    });
  });

  group('serialization', () {
    test('no moderated info lost', () {
      final Caucus caucus = new ModeratedCaucus(topic: 'test', length: 100, speakingLength: 10);
      final Caucus constructedCaucus = new Caucus.fromJson(json.decode(json.encode(caucus)));
      /// Json has to be compared since classes data cannot be compared
      expect(constructedCaucus, const isInstanceOf<ModeratedCaucus>());
      expect(constructedCaucus.toJson(), equals(caucus.toJson()));
    });

    test('no unmoderated info lost', () {
      final Caucus caucus = new UnmoderatedCaucus(topic: 'test', length: 100);
      final Caucus constructedCaucus = new Caucus.fromJson(json.decode(json.encode(caucus)));
      /// Json has to be compared since classes data cannot be compared
      expect(constructedCaucus, const isInstanceOf<UnmoderatedCaucus>());
      expect(constructedCaucus.toJson(), equals(caucus.toJson()));
    });

    test('no other info lost', () {
      final Caucus caucus = new OtherCaucus(topic: 'test', length: 100);
      final Caucus constructedCaucus = new Caucus.fromJson(json.decode(json.encode(caucus)));
      /// Json has to be compared since classes data cannot be compared
      expect(constructedCaucus, const isInstanceOf<OtherCaucus>());
      expect(constructedCaucus.toJson(), equals(caucus.toJson()));
    });
  });
}
