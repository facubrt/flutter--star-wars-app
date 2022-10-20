import 'package:starwapp/src/domain/repositories/isw_repository.dart';
import 'package:starwapp/src/domain/repositories/sw_repository.dart';

class GetHomeworldUseCase {
  final ISWRepository _swRepository = SWRepository();

  Future<String> call({required String url}) async =>
      _swRepository.getHomeworld(url: url);
}
