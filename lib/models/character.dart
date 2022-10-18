// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  const factory Character({
    required String name,
    required String height,
    required String mass,
    required String hair_color,
    required String eye_color,
    required String birth_year,
    required String gender,
    required String homeworld,
    required List<String>? vehicles,
    required List<String>? starships,
  }) = _Character;

  factory Character.fromJson(Map<String, Object?> json) =>
      _$CharacterFromJson(json);
}
