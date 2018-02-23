// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Committee _$CommitteeFromJson(Map<String, dynamic> json) => new Committee(
    topic: json['topic'] as String,
    delegates: (json['delegates'] as List)
        ?.map((e) =>
            e == null ? null : new Delegate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    caucuses: (json['caucuses'] as List)?.map((e) =>
        e == null ? null : new Caucus.fromJson(e as Map<String, dynamic>)));

abstract class _$CommitteeSerializerMixin {
  String get topic;
  List<Delegate> get delegates;
  Queue<Caucus> get caucuses;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'topic': topic,
        'delegates': delegates,
        'caucuses': caucuses?.toList()
      };
}
