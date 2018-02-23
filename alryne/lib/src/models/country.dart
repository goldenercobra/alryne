import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:meta/meta.dart' show required;

part 'country.g.dart';

/// Represents a Country
@JsonSerializable()
class Country extends Object with _$CountrySerializerMixin {
  /// Full Name of the Country
  @override
  final String name;

  /// Country identifier (ISO3166-1 Alpha-3)
  @override
  final String short;

  /// Country Id
  @override
  final int id;

  /// Constructs [Country] from [name] and [short] identifier
  Country({@required this.name, @required this.short, @required this.id})
      : assert(name != null),
        assert(short != null),
        assert(short.length == 3),
        assert(id != null);

  /// Constructs [Country] from [map]
  factory Country.fromJson(Map<String, dynamic> map) => _$CountryFromJson(map);
}