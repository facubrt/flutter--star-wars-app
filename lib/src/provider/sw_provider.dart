import 'package:flutter/material.dart';
import 'package:starwapp/src/data/models/character.dart';
import 'package:starwapp/src/data/models/report.dart';
import 'package:starwapp/src/data/models/starship.dart';
import 'package:starwapp/src/data/models/vehicle.dart';
import 'package:starwapp/src/repositories/sw_repository.dart';

class SWProvider with ChangeNotifier {
  List<Character> _people = [];
  List<Character> _morePeople = [];
  SWRepository swRepository = SWRepository();
  int _page = 0;
  int? _idCharacter;
  bool _isFirstLoad = true;
  bool _hasNextPage = true;

  void getFirstPagePeople() async {
    _page = 1;
    _people = await swRepository.getPeople(page: _page);
    _isFirstLoad = false;
    _hasNextPage = true;
    notifyListeners();
  }

  Future<bool> getPeople() async {
    _page++;
    _morePeople = await swRepository.getPeople(page: _page);
    if (_morePeople.isNotEmpty) {
      people.addAll(_morePeople);
    } else {
      _hasNextPage = false;
    }
    notifyListeners();
    return true;
  }

  Future<String> getCharacterHomeworld({required String homeworld}) async =>
      swRepository.getHomeworld(url: homeworld);

  Future<List<Vehicle>> getVehicles({required List<String> vehicles}) async =>
      swRepository.getVehicles(urls: vehicles);

  Future<List<Starship>> getStarships(
          {required List<String> starships}) async =>
      swRepository.getStarships(urls: starships);

  Future<String?> postReport({required Report report}) async =>
      swRepository.postReport(report: report);

  get currentPage => _page;
  get people => _people;
  get isFirstLoadPeople => _isFirstLoad;
  get hasNextPage => _hasNextPage;
  int get idCharacter => _idCharacter!;
  set idCharacter(int id) {
    _idCharacter = id;
  }
}
