import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/core/error/failures.dart';

import 'package:weather/features/weather/domain/entity/weather.dart';

abstract class WeatherRepository {

  Future<Either<Failure, WeatherData>> getWeather(String city);
}
