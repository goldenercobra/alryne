import 'dart:collection' show Queue;

import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:meta/meta.dart' show required;

import 'caucus.dart' show Caucus;
import 'delegate.dart' show Delegate;

part 'committee.g.dart';

/// Discussed Committee
@JsonSerializable()
class Committee extends Object with _$CommitteeSerializerMixin {
  /// Topic of the Committee
  final String topic;

  /// Total list of delegates
  List<Delegate> delegates;

  /// Elapsed caucuses, in order
  Queue<Caucus> caucuses;

  /// Constructs [Committee] from topic, delegates, and caucuses
  Committee(
      {@required this.topic, @required this.delegates, @required this.caucuses})
      : assert(topic != null),
        assert(delegates != null),
        assert(caucuses != null);

  /// Constructs [Committee] from [Map]
  factory Committee.fromJson(Map<String, dynamic> map) => _$CommitteeFromJson(map);

  /// Get current caucus
  Caucus get currentCaucus => caucuses.last;
}