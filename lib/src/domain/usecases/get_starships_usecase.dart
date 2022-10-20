import 'package:starwapp/src/data/models/starship.dart';
import 'package:starwapp/src/domain/repositories/isw_repository.dart';
import 'package:starwapp/src/domain/repositories/sw_repository.dart';

class GetStarshipsUseCase {
  final ISWRepository _swRepository = SWRepository();

  Future<List<Starship>> call({required List<String> urls}) async =>
      _swRepository.getStarships(urls: urls);
}
