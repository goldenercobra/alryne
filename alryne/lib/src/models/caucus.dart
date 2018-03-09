import 'package:meta/meta.dart' show required;

import 'delegate.dart' show Delegate;

enum _CaucusTag { caucus, moderated, unmoderated, other }

/// Base Caucus Implementation
abstract class Caucus extends Object {
  /// Topic of the caucus
  final String topic;

  /// Length of the caucus (in seconds)
  final int length;

  final _CaucusTag _tag = _CaucusTag.caucus;

  /// Constructs [Caucus]
  Caucus({@required this.topic, @required this.length})
      : assert(topic != null),
        assert(length != null);

  /// Constructs [Caucus] indirectly by delegating to child objects.
  factory Caucus.fromJson(Map<String, dynamic> map) {
    switch (_CaucusTag.values.firstWhere(
        (_CaucusTag tag) => tag.toString().split('.')[1] == map['tag'],
        orElse: () =>
            throw ArgumentError.value(map, 'map', 'invalid [tag] provided'))) {
      case _CaucusTag.moderated:
        return new ModeratedCaucus.fromJson(map);
      case _CaucusTag.unmoderated:
        return new UnmoderatedCaucus.fromJson(map);
      case _CaucusTag.other:
        return new OtherCaucus.fromJson(map);
      case _CaucusTag.caucus:
      default:
        throw new ArgumentError.value(map, 'map', 'invalid [tag] provided');
    }
  }

  /// Convert [Caucus] into a Map Object which can be serialized
  Map<String, dynamic> toJson() => <String, dynamic>{
        'tag': _tag.toString().split('.')[1],
        'topic': topic,
        'length': length,
      };
}

/// Moderated Caucus, a set list of speakers and speaking time
class ModeratedCaucus extends Caucus {
  /// How long each speaker can speak (in seconds)
  int speakingLength;

  /// List of speakers, in order
  List<Delegate> _speakers;

  @override
  // ignore: overridden_fields
  final _CaucusTag _tag = _CaucusTag.moderated;

  /// Constructs [ModeratedCaucus]
  ModeratedCaucus({
    @required String topic,
    @required int length,
    @required this.speakingLength,
  })  : assert(topic != null),
        assert(length != null),
        assert(speakingLength != null),
        super(topic: topic, length: length) {
    if (length % speakingLength != 0) {
      throw new ArgumentError.value(speakingLength, 'speakingLength',
          'must divide into [length] perfectly');
    }
  }

  /// Construct [ModeratedCaucus] from [map]
  @override
  ModeratedCaucus.fromJson(Map<String, dynamic> map)
      : assert(map['tag'] != null),
        assert(map['speakingLength'] != null),
        speakingLength = map['speakingLength'],
        _speakers = map['speakers']?.map((Map<String, dynamic> item) => new Delegate.fromJson(map))?.toList(),
        assert(map['topic'] != null),
        assert(map['length'] != null),
        super(topic: map['topic'], length: map['length']);

  /// Convert [ModeratedCaucus] into a Map Object which can be serialized
  /// Inherits from [Caucus] and adds additional fields
  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'speakingLength': speakingLength,
      'speakers': _speakers
    });

  /// Number of speakers avaliable
  int get speakersSize => (super.length / speakingLength).round();

  /// Returns an encapsulated speakers list
  List<Delegate> get speakers => _speakers;

  /// Set [speakers], checking that the length of the given List matches
  void set speakers(List<Delegate> speakers) {
    if (speakers.length != speakersSize) {
      throw new ArgumentError.value(speakers, 'speakers',
          'speakers length must match with determined length');
    }
    _speakers = speakers;
  }
}

/// Unmoderated Caucus, basically a free-for-all
class UnmoderatedCaucus extends Caucus {
  @override
  // ignore: overridden_fields
  final _CaucusTag _tag = _CaucusTag.unmoderated;

  /// Constructs [UnmoderatedCaucus]
  UnmoderatedCaucus({@required String topic, @required int length})
      : assert(topic != null),
        assert(length != null),
        super(topic: topic, length: length);

  /// Constructs [UnmoderatedCaucus] from [map]
  @override
  UnmoderatedCaucus.fromJson(Map<String, dynamic> map)
      : assert(map['tag'] != null),
        assert(map['topic'] != null),
        assert(map['length'] != null),
        super(topic: map['topic'], length: map['length']);
}

/// Other Caucus, for unrelated events (censure, join new country, etc)
class OtherCaucus extends Caucus {
  @override
  // ignore: overridden_fields
  final _CaucusTag _tag = _CaucusTag.other;

  /// Constructs [OtherCaucus]
  OtherCaucus({@required String topic, @required int length})
      : assert(topic != null),
        assert(length != null),
        super(topic: topic, length: length);

  /// Constructs [OtherCaucus] from [map]
  @override
  OtherCaucus.fromJson(Map<String, dynamic> map)
      : assert(map['tag'] != null),
        assert(map['topic'] != null),
        assert(map['length'] != null),
        super(topic: map['topic'], length: map['length']);
}
