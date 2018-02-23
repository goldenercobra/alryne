// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delegate.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Delegate _$DelegateFromJson(Map<String, dynamic> json) => new Delegate(
    names: (json['names'] as List)?.map((e) => e as String)?.toList(),
    country: json['country'] == null
        ? null
        : new Country.fromJson(json['country'] as Map<String, dynamic>));

abstract class _$DelegateSerializerMixin {
  List<String> get names;
  Country get country;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'names': names, 'country': country};
}
