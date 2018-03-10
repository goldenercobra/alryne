// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conference.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Conference _$ConferenceFromJson(Map<String, dynamic> json) => new Conference(
    id: json['id'] as String,
    committee:
        new Committee.fromJson(json['committee'] as Map<String, dynamic>));

abstract class _$ConferenceSerializerMixin {
  String get id;
  Committee get committee;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'committee': committee};
}
