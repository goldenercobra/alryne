// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => new Country(
    name: json['name'] as String,
    short: json['short'] as String,
    id: json['id'] as int);

abstract class _$CountrySerializerMixin {
  String get name;
  String get short;
  int get id;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'name': name, 'short': short, 'id': id};
}
