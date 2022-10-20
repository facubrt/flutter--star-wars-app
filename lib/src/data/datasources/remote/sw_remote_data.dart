import 'package:dio/dio.dart';
import 'package:starwapp/src/data/datasources/remote/isw_remote_data.dart';
import 'package:starwapp/src/data/models/character.dart';
import 'package:starwapp/src/data/models/starship.dart';
import 'package:starwapp/src/data/models/vehicle.dart';

class SWRemoteData implements ISWRemoteData {
  @override
  Future<List<Character>> getPeople({required int page}) async {
    final _dioClient = Dio();
    final url = 'https://swapi.dev/api/people/?page=$page';
    List<Character> people = [];
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
  }

  @override
  Future<String> getHomeworld({required String url}) async {
    final _dioClient = Dio();
    final result = await _dioClient.get(url);
    if (result.statusCode == 200) {
      return result.data['name'];
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<Vehicle>> getVehicles({required List<String> urls}) async {
    final _dioClient = Dio();
    final List<Vehicle> vehicles = [];
    for (var url in urls) {
      final result = await _dioClient.get(url);
      if (result.statusCode == 200) {
        vehicles.add(Vehicle.fromJson(result.data));
      } else {
        throw Exception();
      }
    }
    return vehicles;
  }

  @override
  Future<List<Starship>> getStarships({required List<String> urls}) async {
    final _dioClient = Dio();
    List<Starship> starships = [];
    for (var url in urls) {
      final result = await _dioClient.get(url);
      if (result.statusCode == 200) {
        starships.add(Starship.fromJson(result.data));
      } else {
        throw Exception();
      }
    }
    return starships;
  }

  @override
  Future<String?> postReport({required Character character}) async {
    final _dioClient = Dio();
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final result = await _dioClient.post(url, queryParameters: {
      'userId': character.name,
      'dateTime': DateTime.now().toString(),
      'character_name': character.name,
    });
    return result.statusMessage;
  }
}
