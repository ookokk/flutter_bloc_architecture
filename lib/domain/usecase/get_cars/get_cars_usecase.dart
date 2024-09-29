import 'package:bloc_architecture/domain/repository/car/car_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/network/network_error.dart';
import '../../model/cars/cars_model.dart';

class GetCarsUseCase {
  GetCarsUseCase({required this.iCarRepository});
  ICarRepository iCarRepository;

  Future<Either<Failure, CarsModel?>?> getCars() async {
    try {
      CarsModel? cars = await iCarRepository.getCars();
      return Right(cars);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(
            Failure(errorMessage: e.message, statusCode: e.response?.statusCode));
      } else {
        return Left(
            Failure(errorMessage: e.message, statusCode: e.response?.statusCode));
      }
    }
  }
}
