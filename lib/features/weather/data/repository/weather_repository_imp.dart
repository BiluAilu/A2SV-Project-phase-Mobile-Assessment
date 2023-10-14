import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/core/network/network_info.dart';
import 'package:weather/features/weather/data/resources/weather_remote_datasource.dart';
import 'package:weather/features/weather/domain/entity/weather.dart';
import 'package:weather/features/weather/domain/repository/weather_repository.dart';


class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
   final NetworkInfo networkInfo;

  WeatherRepositoryImpl({required this.remoteDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, WeatherData>> getWeather(String city) async {
    return remoteDataSource.getWeather(city);
  }
}
