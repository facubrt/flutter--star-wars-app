import 'package:starwapp/src/data/models/character.dart';
import 'package:starwapp/src/domain/repositories/isw_repository.dart';
import 'package:starwapp/src/domain/repositories/sw_repository.dart';

class PostReportUseCase {
  final ISWRepository _swRepository = SWRepository();

  Future<String?> call({required Character character}) async =>
      _swRepository.postReport(character: character);
}
