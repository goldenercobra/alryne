import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:meta/meta.dart' show required;

part 'crisis.g.dart';

/// A crisis, a change in events elapsed
@JsonSerializable(nullable: false)
class Crisis extends Object with _$CrisisSerializerMixin {
  /// Topic of Crisis
  @override
  final String topic;

  /// Construct [Crisis] given [topic]
  Crisis({@required this.topic});

  /// Construct [Crisis] from [map]
  factory Crisis.fromJson(Map<String, dynamic> map) => _$CrisisFromJson(map);

  @override
  bool operator ==(dynamic other) => other is Crisis && other.topic == topic;

  @override
  int get hashCode => topic.hashCode;
}
