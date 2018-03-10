import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:collection/collection.dart' show ListEquality;
import 'package:quiver/core.dart' show hash2;

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
  Delegate({this.names, this.country});

  /// Constructs [Delegate] from [map]
  factory Delegate.fromJson(Map<String, dynamic> map) =>
      _$DelegateFromJson(map);

  /// Returns true if delegation is managed by a single delegate
  bool get single => names.length == 1;

  @override
  bool operator ==(dynamic other) =>
      other is Delegate && const ListEquality<String>().equals(other.names, names) && other.country == country;

  @override
  int get hashCode => hash2(names.hashCode, country.hashCode);
}
