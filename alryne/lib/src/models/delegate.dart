import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:meta/meta.dart' show required;

import 'country.dart' show Country;

part 'delegate.g.dart';

/// A Delegate
@JsonSerializable()
class Delegate extends Object with _$DelegateSerializerMixin {
  /// List of people who are representing the country
  @override
  List<String> names;

  /// Country the delegate is representing
  @override
  Country country;

  /// Constructs [Delegate] from [names] and [country]
  Delegate({@required this.names, @required this.country})
      : assert(names != null),
        assert(country != null);

  /// Constructs [Delegate] from [map]
  factory Delegate.fromJson(Map<String, dynamic> map) => _$DelegateFromJson(map);

  /// Returns true if delegation is managed by a single delegate
  bool get single => names.length == 1;
}