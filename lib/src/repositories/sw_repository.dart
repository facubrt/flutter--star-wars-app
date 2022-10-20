import 'package:starwapp/src/data/models/report.dart';
import 'package:starwapp/src/repositories/isw_repository.dart';
import 'package:starwapp/src/data/datasources/remote/sw_remote_data.dart';
import 'package:starwapp/src/data/models/character.dart';
import 'package:starwapp/src/data/models/starship.dart';
import 'package:starwapp/src/data/models/vehicle.dart';

class SWRepository implements ISWRepository {
  final SWRemoteData _swRemote = SWRemoteData();

  @override
  Future<List<Character>> getPeople({required int page}) async {
    List<Character> people = [];
    // Aca se podria implementar logica para saber si consultar a DB local o remota
    people = await _swRemote.getPeople(page: page); 
    return people;
  }

  @override
  Future<String> getHomeworld({required String url}) async {
    final String homeworld;
    try {
      homeworld = await _swRemote.getHomeworld(url: url);
      return homeworld;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Vehicle>> getVehicles({required List<String> urls}) async {
    List<Vehicle> vehicles = [];
    try {
      vehicles = await _swRemote.getVehicles(urls: urls);
      return vehicles;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Starship>> getStarships({required List<String> urls}) async {
    List<Starship> starships = [];
    try {
      starships = await _swRemote.getStarships(urls: urls);
      return starships;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<String?> postReport({required Report report}) async {
    try {
      final String? resultMsg =
          await _swRemote.postReport(report: report);
      return resultMsg;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
