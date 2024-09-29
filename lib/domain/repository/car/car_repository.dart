import 'package:bloc_architecture/domain/model/cars/cars_model.dart';

abstract class ICarRepository {
  Future<CarsModel?> getCars();
}
