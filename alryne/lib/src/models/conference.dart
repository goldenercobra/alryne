import 'dart:math' as math;

import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:meta/meta.dart' show required;

import 'committee.dart';

part 'conference.g.dart';

/// A wrapper over [Committee] for easy storage
@JsonSerializable(nullable: false)
class Conference extends Object with _$ConferenceSerializerMixin {
  /// Id of the Conference, used for storing purposes
  @override
  final String id;

  /// Committee being discussed at the conference
  @override
  final Committee committee;

  /// Construct [Conference]
  Conference(
      {@required this.id, @required this.committee})
      : assert(id != null),
        assert(committee != null);

  /// Create new [Conference], generating a random new Id
  Conference.create({@required String topic})
      : assert(topic != null),
        id = generateId(),
        committee = new Committee(topic: topic);

  /// Construct [Conference] from [map]
  factory Conference.fromJson(Map<String, dynamic> map) => _$ConferenceFromJson(map);

  /// Generate Random Id
  static String generateId([math.Random generator]) => new String.fromCharCodes(
      new List<int>.generate(4, (_) => (generator ?? new math.Random.secure()).nextInt(25) + 65));
}
