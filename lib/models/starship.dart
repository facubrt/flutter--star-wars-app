import 'package:freezed_annotation/freezed_annotation.dart';

part 'starship.freezed.dart';
part 'starship.g.dart';

@freezed
class Starship with _$Starship {
  const factory Starship({
    required String name,
    required String model,
  }) = _Starship;

  factory Starship.fromJson(Map<String, Object?> json) =>
      _$StarshipFromJson(json);
}
