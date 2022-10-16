import 'package:starwapp/models/starship.dart';
import 'package:starwapp/models/vehicle.dart';

class Character {
  String? name;
  String? gender;
  String? homeworld;
  String? birthYear;
  String? hairColor;
  String? eyeColor;
  String? height;
  String? mass;
  List<Vehicle>? vehicles;
  List<Starship>? starships;

  Character({
    this.name,
    this.gender,
    this.birthYear,
    this.homeworld,
    this.hairColor,
    this.eyeColor,
    this.height,
    this.mass,
    this.vehicles,
    this.starships,
  });
}
