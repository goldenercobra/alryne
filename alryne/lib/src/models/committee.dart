import 'package:collection/collection.dart' show ListEquality;
import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;
import 'package:meta/meta.dart' show required;
import 'package:quiver/core.dart' show hash4;

import 'caucus.dart' show Caucus;
import 'crisis.dart' show Crisis;
import 'delegate.dart' show Delegate;

part 'committee.g.dart';

/// Discussed Committee
@JsonSerializable()
class Committee extends Object with _$CommitteeSerializerMixin {
  /// Topic of the Committee
  @override
  @JsonKey(nullable: false)
  final String topic;

  /// Total list of delegates
  @override
  List<Delegate> delegates;

  /// Elapsed caucuses, in order
  @override
  List<Caucus> caucuses;

  /// Crises, elapsed or not
  @override
  List<Crisis> crises;

  /// Constructs [Committee] from topic, delegates, and caucuses
  Committee({@required this.topic, this.delegates, this.caucuses, this.crises})
      : assert(topic != null);

  /// Constructs [Committee] from [map]
  factory Committee.fromJson(Map<String, dynamic> map) =>
      _$CommitteeFromJson(map);

  /// Get current caucus
  Caucus get currentCaucus => caucuses.last;

  @override
  bool operator ==(dynamic other) =>
      other is Committee &&
      other.topic == topic &&
      const ListEquality<Delegate>().equals(other.delegates, delegates) &&
      const ListEquality<Caucus>().equals(other.caucuses, caucuses) &&
      const ListEquality<Crisis>().equals(other.crises, crises);

  @override
  int get hashCode => hash4(
      topic.hashCode, delegates.hashCode, caucuses.hashCode, crises.hashCode);
}
