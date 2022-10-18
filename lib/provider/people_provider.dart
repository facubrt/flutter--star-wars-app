import 'package:flutter/material.dart';
import 'package:starwapp/models/character.dart';
import 'package:starwapp/models/starship.dart';
import 'package:starwapp/models/vehicle.dart';
import 'package:starwapp/repositories/people_repository.dart';

class PeopleProvider with ChangeNotifier {
  List<Character> people = [];
  PeopleRepository peopleRepository = PeopleRepository();

  Future<List<Character>> getPeople({required int page}) async =>
      peopleRepository.getPeople(page: page);

  Future<String> getCharacterHomeworld({required String homeworld}) async =>
      peopleRepository.getCharacterHomeworld(url: homeworld);

  Future<List<Vehicle>> getVehicles({required List<String> vehicles}) async =>
      peopleRepository.getVehicles(urls: vehicles);

  Future<List<Starship>> getStarships(
          {required List<String> starships}) async =>
      peopleRepository.getStarships(urls: starships);
}
