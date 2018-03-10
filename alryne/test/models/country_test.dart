import 'dart:convert' show json;

import 'package:alryne/models.dart' show Country;

import 'package:test/test.dart';

void main() {
  group('constructor', (){
    test('> runs correctly', (){
      expect(() => new Country(name: 'ABCistan', short: 'ABC', id: 123), returnsNormally);
      final Country country = new Country(name: 'ABCistan', short: 'ABC', id: 123);
      expect(country.name, equals('ABCistan'));
      expect(country.short, equals('ABC'));
      expect(country.id, equals(123));
    });
    test('> fails if short length != 3', (){
      expect(() => new Country(name: 'ABCistan', short: 'ABCistan', id: 123), throwsArgumentError);
    });
  });

  group('serialization', (){
    test('> seriailzes correctly', (){
      final Country country = new Country(name: 'ABCistan', short: 'ABC', id: 123);
      final Country constructedCountry = new Country.fromJson(json.decode(json.encode(country)));
      expect(constructedCountry.toJson(), equals(country.toJson()));
    });
  });
}