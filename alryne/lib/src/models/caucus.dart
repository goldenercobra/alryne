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
  final int length;

  /// Length of speaking time (in seconds), only for moderated caucus
  int speakingLength;

  /// Type of caucus
  final CaucusType type;

  /// List of speakers, only for moderated caucus
  List<Delegate> _speakers;

  /// Constructs Caucus from [length], [type], and optional [speakingLength]
  Caucus({@required this.length, @required this.type, int speakingLength})
      : assert(length != null),
        assert(type != null) {
    if (type != CaucusType.moderated) {
      // Unmoderated caucuses do not need a speaking time
      return;
    }
    if (length % speakingLength == 0) {
      this.speakingLength = speakingLength;
    } else {
      throw new ArgumentError(
          '[speakingLength] must divide evenly into caucus length');
    }
  }

  /// Constructs Caucus from [map]
  factory Caucus.fromJson(Map<String, dynamic> map) => _$CaucusFromJson(map);

  /// Return maximum speakers
  int get speakersSize => (length / speakingLength).round();

  /// Return list of speakers
  List<Delegate> get speakers => _speakers;
  
  /// Set list of speakers
  void set speakers(List<Delegate> speakers) {
    if (speakers.length != speakersSize) {
      throw new ArgumentError('[speakers] size must be correct size');
    }
    _speakers = speakers;
  }
}