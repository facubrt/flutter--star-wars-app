import 'package:dio/dio.dart';
import 'package:starwapp/models/character.dart';
import 'package:starwapp/models/starship.dart';
import 'package:starwapp/models/vehicle.dart';

class PeopleRepository {
  Future<List<Character>> getPeople({required int page}) async {
    final _dioClient = Dio();
    final url = 'https://swapi.dev/api/people/?page=$page';
    List<Character> people = [];
    try {
      final result = await _dioClient.get(url);
      if (result.statusCode == 200) {
        result.data['results'].forEach((res) {
          final Character character = Character.fromJson(res);
          people.add(character);
        });
        return people;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<String> getCharacterHomeworld({required String url}) async {
    final _dioClient = Dio();
    try {
      final result = await _dioClient.get(url);
      if (result.statusCode == 200) {
        return result.data['name'];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<Vehicle>> getVehicles({required List<String> urls}) async {
    final _dioClient = Dio();
    final List<Vehicle> vehicles = [];
    try {
      for (var url in urls) {
        final result = await _dioClient.get(url);
        if (result.statusCode == 200) {
          vehicles.add(Vehicle.fromJson(result.data));
        } else {
          throw Exception();
        }
      }
      return vehicles;
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<Starship>> getStarships({required List<String> urls}) async {
    final _dioClient = Dio();
    final List<Starship> starships = [];
    try {
      for (var url in urls) {
        final result = await _dioClient.get(url);
        if (result.statusCode == 200) {
          starships.add(Starship.fromJson(result.data));
        } else {
          throw Exception();
        }
      }
      return starships;
    } catch (e) {
      throw Exception();
    }
  }
}
