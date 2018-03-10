import 'dart:convert' show json;

import 'package:alryne/models.dart'
    show Caucus, Committee, Country, Delegate, ModeratedCaucus, OtherCaucus;

import 'package:test/test.dart';

void main() {
  group('constructor', () {
    test('> only topic', () {
      final Committee committee = new Committee(topic: 'test');
      expect(committee.topic, equals('test'));
    });

    test('> topic and delegates', () {
      final List<Delegate> delegates = <Delegate>[
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
      final Committee committee =
          new Committee(topic: 'test', delegates: delegates);
      expect(committee.topic, equals('test'));
      expect(committee.delegates, equals(delegates));
    });

    test('> topic and caucuses', () {
      final List<Caucus> caucuses = <Caucus>[
        new ModeratedCaucus(topic: 'test', length: 100, speakingLength: 10),
        new OtherCaucus(topic: 'othertest', length: 150),
      ];
      final Committee committee =
          new Committee(topic: 'test', caucuses: caucuses);
      expect(committee.topic, equals('test'));
      expect(committee.caucuses, equals(caucuses));
      expect(committee.currentCaucus, equals(caucuses.last));
    });

    test('> topic, delegates, caucuses', () {
      final List<Caucus> caucuses = <Caucus>[
        new ModeratedCaucus(topic: 'test', length: 100, speakingLength: 10),
        new OtherCaucus(topic: 'othertest', length: 150),
      ];
      final List<Delegate> delegates = <Delegate>[
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
      final Committee committee = new Committee(
          topic: 'test', delegates: delegates, caucuses: caucuses);
      expect(committee.topic, equals('test'));
      expect(committee.delegates, equals(delegates));
      expect(committee.caucuses, equals(caucuses));
      expect(committee.currentCaucus, equals(caucuses.last));
    });
  });

  group('serialization', () {
    test('> only topic', () {
      final Committee committee = new Committee(topic: 'test');
      final Committee constructedCommittee =
          new Committee.fromJson(json.decode(json.encode(committee)));
      expect(constructedCommittee.toJson(), equals(committee.toJson()));
    });

    test('> topic and delegates', () {
      final List<Delegate> delegates = <Delegate>[
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
      final Committee committee =
          new Committee(topic: 'test', delegates: delegates);
      final Committee constructedCommittee =
          new Committee.fromJson(json.decode(json.encode(committee)));
      constructedCommittee.delegates.forEach(print);
      expect(constructedCommittee.toJson(), equals(committee.toJson()));
    });

    test('> topic and caucuses', () {
      final List<Caucus> caucuses = <Caucus>[
        new ModeratedCaucus(topic: 'test', length: 100, speakingLength: 10),
        new OtherCaucus(topic: 'othertest', length: 150),
      ];
      final Committee committee =
          new Committee(topic: 'test', caucuses: caucuses);
      final Committee constructedCommittee =
          new Committee.fromJson(json.decode(json.encode(committee)));
      expect(constructedCommittee.toJson(), equals(committee.toJson()));
    });

    test('> topic, delegates, caucuses', () {
      final List<Caucus> caucuses = <Caucus>[
        new ModeratedCaucus(topic: 'test', length: 100, speakingLength: 10),
        new OtherCaucus(topic: 'othertest', length: 150),
      ];
      final List<Delegate> delegates = <Delegate>[
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
      final Committee committee = new Committee(
          topic: 'test', delegates: delegates, caucuses: caucuses);
      final Committee constructedCommittee =
          new Committee.fromJson(json.decode(json.encode(committee)));
      expect(constructedCommittee.toJson(), equals(committee.toJson()));
    });
  });
}
