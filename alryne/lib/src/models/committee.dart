import 'dart:collection' show Queue;

import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:meta/meta.dart' show required;

import 'caucus.dart' show Caucus;
import 'crisis.dart' show Crisis;
import 'delegate.dart' show Delegate;

part 'committee.g.dart';

/// Discussed Committee
@JsonSerializable()
class Committee extends Object with _$CommitteeSerializerMixin {
  /// Topic of the Committee
  @override
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
  Committee(
      {@required this.topic, this.delegates, this.caucuses, this.crises})
      : assert(topic != null);

  /// Constructs [Committee] from [map]
  factory Committee.fromJson(Map<String, dynamic> map) => _$CommitteeFromJson(map);

  /// Get current caucus
  Caucus get currentCaucus => caucuses.last;
}