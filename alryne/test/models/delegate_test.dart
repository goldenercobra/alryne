import 'dart:convert' show json;

import 'package:alryne/models.dart' show Country, Delegate;

import 'package:test/test.dart';

void main() {
  group('constructor', () {
    test('> runs correctly', () {
      final Delegate delegate = new Delegate(
          names: <String>['Hello', 'World'],
          country: new Country(name: 'ABCistan', short: 'ABC', id: 123));
      expect(delegate.names, equals(<String>['Hello', 'World']));
      expect(delegate.country,
          equals(new Country(name: 'ABCistan', short: 'ABC', id: 123)));
    });
  });

  group('serialization', () {
    test('> serializes correctly', () {
      final Delegate delegate = new Delegate(
          names: <String>['Hello', 'World'],
          country: new Country(name: 'ABCistan', short: 'ABC', id: 123));
      final Delegate constructedDelegate =
          new Delegate.fromJson(json.decode(json.encode(delegate)));
      expect(constructedDelegate, equals(delegate));
    });
  });
}
