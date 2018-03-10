import 'package:meta/meta.dart' show required;
import 'package:json_annotation/json_annotation.dart';

part 'crisis.g.dart';

@JsonSerializable()
/// A crisis, a change in events elapsed
class Crisis extends Object with _$CrisisSerializerMixin {
  /// Topic of Crisis
  final String topic;

  /// Construct [Crisis] given [topic]
  Crisis({@required this.topic});

  factory Crisis.fromJson(Map<String, dynamic> map) => _$CrisisFromJson(map);
}