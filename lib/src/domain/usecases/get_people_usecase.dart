import 'package:starwapp/src/data/models/character.dart';
import 'package:starwapp/src/domain/repositories/isw_repository.dart';
import 'package:starwapp/src/domain/repositories/sw_repository.dart';

class GetPeopleUseCase {
  final ISWRepository _swRepository = SWRepository();

  Future<List<Character>> call({required int page}) async =>
      _swRepository.getPeople(page: page);
}
