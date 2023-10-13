import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/core/usecase/usecase.dart';
import 'package:weather/features/weather/domain/entity/weather.dart';
import 'package:weather/features/weather/domain/repository/weather_repository.dart';
import 'package:equatable/equatable.dart';

class GetWeatherUseCase implements Usecase<WeatherData, GetWeatherParams> {
  final WeatherRepository repository;

  GetWeatherUseCase({required this.repository});

  @override
  Future<Either<Failure, WeatherData>> call(GetWeatherParams params) async {
    return await repository.getWeather(params.city);
  }
}


class GetWeatherParams extends Equatable {
  final String city;

  GetWeatherParams({required this.city});

  @override
  List<Object?> get props => [city];
}
