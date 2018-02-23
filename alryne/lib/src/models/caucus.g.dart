// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caucus.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Caucus _$CaucusFromJson(Map<String, dynamic> json) => new Caucus(
    length: json['length'] as int,
    type: json['type'] == null
        ? null
        : CaucusType.values
            .singleWhere((x) => x.toString() == "CaucusType.${json['type']}"),
    speakingLength: json['speakingLength'] as int)
  ..speakers = (json['speakers'] as List)
      ?.map((e) =>
          e == null ? null : new Delegate.fromJson(e as Map<String, dynamic>))
      ?.toList();

abstract class _$CaucusSerializerMixin {
  int get length;
  int get speakingLength;
  CaucusType get type;
  List<Delegate> get speakers;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'length': length,
        'speakingLength': speakingLength,
        'type': type == null ? null : type.toString().split('.')[1],
        'speakers': speakers
      };
}
