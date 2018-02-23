import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:meta/meta.dart' show required;

import 'delegate.dart' show Delegate;

part 'caucus.g.dart';

/// Type of caucus, moderated or unmoderated
enum CaucusType {
  /// moderated caucus
  moderated,

  /// unmoderated caucus
  unmoderated,

  /// extension to a previous caucus
  extension,

  /// other (censure, extraneous votes)
  other
}

/// Describes a caucus
@JsonSerializable()
class Caucus extends Object with _$CaucusSerializerMixin {
  /// Length of caucus (in seconds)
  @override
  final int length;

  /// Length of speaking time (in seconds), only for moderated caucus
  @override
  int speakingLength;

  /// Type of caucus
  @override
  final CaucusType type;

  /// List of speakers, only for moderated caucus
  @override
  List<Delegate> speakers;

  /// Constructs Caucus from [length], [type], and optional [speakingLength]
  Caucus({@required this.length, @required this.type, int speakingLength})
      : assert(length != null),
        assert(type != null) {
    if (type != CaucusType.moderated) {
      // Unmoderated caucuses do not need a speaking time
      return;
    }
    if (length % speakingLength == 0) {
      speakers = new List<Delegate>.filled((length / speakingLength).round(), null);
      this.speakingLength = speakingLength;
    } else {
      throw new ArgumentError(
          '[speakingLength] must divide evenly into caucus length');
    }
  }

  /// Constructs [Caucus] from [map]
  factory Caucus.fromJson(Map<String, dynamic> map) => _$CaucusFromJson(map);

  /// Return maximum speakers
  int get speakersSize => speakers.length;
}