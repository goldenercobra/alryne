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

/// Casts [CaucusType] to [String]
String caucusTypeToString(CaucusType type) {
  switch (type) {
    case CaucusType.moderated:
      return 'moderated';
    case CaucusType.unmoderated:
      return 'unmoderated';
    case CaucusType.extension:
      return 'extension';
    case CaucusType.other:
      return 'other';
    default:
      throw new ArgumentError('Invalid CaucusType');
  }
}

/// Casts [String] to [CaucusType]
CaucusType stringToCaucusType(String string) {
  switch (string) {
    case 'moderated':
      return CaucusType.moderated;
    case 'unmoderated':
      return CaucusType.unmoderated;
    case 'extension':
      return CaucusType.extension;
    case 'other':
      return CaucusType.other;
    default:
      throw new ArgumentError('Invalid String');
  }
}

/// Describes a caucus
@JsonSerializable()
class Caucus extends Object with _$CaucusSerializerMixin {
  /// Length of caucus
  final Duration length;

  /// Length of speaking time, only for moderated caucus
  Duration speakingLength;

  /// Type of caucus
  final CaucusType type;

  /// List of speakers, only for moderated caucus
  List<Delegate> _speakers;

  /// Constructs Caucus from [length], [type], and optional [speakingLength]
  Caucus({@required this.length, @required this.type, Duration speakingLength})
      : assert(length != null),
        assert(type != null) {
    if (type != CaucusType.moderated) {
      // Unmoderated caucuses do not need a speaking time
      return;
    }
    if (length.inSeconds % speakingLength.inSeconds == 0) {
      this.speakingLength = speakingLength;
    } else {
      throw new ArgumentError(
          '[speakingLength] must divide evenly into caucus length');
    }
  }

  /// Constructs Caucus from [map]
  factory Caucus.fromJson(Map<String, dynamic> map) => _$CaucusFromJson(map);

  /// Return maximum speakers
  int get speakersSize => (length.inSeconds / speakingLength.inSeconds).round();

  /// Return list of speakers
  List<Delegate> get speakers => _speakers;

  /// Set list of speakers
  void set speakers(List<Delegate> speakers) {
    if (speakers.length != speakersSize) {
      throw new ArgumentError('[speakers] size must be correct size');
    }
    _speakers = speakers;
  }