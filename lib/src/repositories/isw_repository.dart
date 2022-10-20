import 'package:starwapp/src/data/models/character.dart';
import 'package:starwapp/src/data/models/report.dart';
import 'package:starwapp/src/data/models/starship.dart';
import 'package:starwapp/src/data/models/vehicle.dart';

abstract class ISWRepository {
  Future<List<Character>> getPeople({required int page});

  Future<String> getHomeworld({required String url});

  Future<List<Vehicle>> getVehicles({required List<String> urls});

  Future<List<Starship>> getStarships({required List<String> urls});

  Future<String?> postReport({required Report report});
}
