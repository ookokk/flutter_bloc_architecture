import 'package:bloc_architecture/data/repository/repository_manager.dart';
import 'package:bloc_architecture/domain/model/cars/cars_model.dart';

import '../../../domain/repository/car/car_repository.dart';

class CarRepositoryImpl extends ICarRepository {
  RepositoryManager? repositoryManager;
  CarRepositoryImpl({required this.repositoryManager});

  @override
  Future<CarsModel?> getCars() async {
    CarsModel? cars =
        await repositoryManager?.fetch(path: "cars", model: CarsModel());
    return cars;
  }
}
