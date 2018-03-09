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

      expect(() => new ModeratedCaucus(topic: 'test2', length: 100, speakingLength: 75), throwsArgumentError);
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

  group('moderated caucus speakers size', (){
    test('nothing happens if correct size', (){
      final ModeratedCaucus caucus = new ModeratedCaucus(topic: 'test', length: 150, speakingLength: 50);
      final List<Delegate> speakers = <Delegate>[
        new Delegate(
          names: <String>['A', 'B', 'C'],
          country: new Country(name: 'Abcistan', short: 'ABC', id: 123),
        ),
        new Delegate(
          names: <String>['D', 'E', 'F'],
          country: new Country(name: 'Defistan', short: 'DEF', id: 456),
        ),
        new Delegate(
          names: <String>['G', 'H', 'I'],
          country: new Country(name: 'GHIistan', short: 'GHI', id: 789),
        ),
      ];
      expect(() => caucus.speakers = speakers, returnsNormally);
    });
    test('throws if incorrect size', (){
      final ModeratedCaucus caucus = new ModeratedCaucus(topic: 'test', length: 150, speakingLength: 50);
      final List<Delegate> speakers = <Delegate>[
        new Delegate(
          names: <String>['A', 'B', 'C'],
          country: new Country(name: 'Abcistan', short: 'ABC', id: 123),
        ),
        new Delegate(
          names: <String>['D', 'E', 'F'],
          country: new Country(name: 'Defistan', short: 'DEF', id: 456),
        ),
      ];
      expect(() => caucus.speakers = speakers, throwsArgumentError);
    });
  });
}
