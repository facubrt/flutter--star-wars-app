import 'package:starwapp/src/data/models/vehicle.dart';
import 'package:starwapp/src/domain/repositories/isw_repository.dart';
import 'package:starwapp/src/domain/repositories/sw_repository.dart';

class GetVehiclesUseCase {
  final ISWRepository _swRepository = SWRepository();

  Future<List<Vehicle>> call({required List<String> urls}) async =>
      _swRepository.getVehicles(urls: urls);
}
