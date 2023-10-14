

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/core/utils/constants.dart';
import 'package:weather/features/weather/data/model/weather_model.dart';
import 'package:weather/features/weather/domain/entity/weather.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

abstract class WeatherRemoteDataSource {
  Future<Either<Failure, WeatherData>> getWeather(String city);

}





class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
 late http.Client client; // Define httpClient

  WeatherRemoteDataSourceImpl({required this.client });
  @override
  Future<Either<Failure, WeatherData>> getWeather(String city) async {
    const endpoint = '/premium/v1/weather.ashx'; // Adjust this based on your API
    const numOfDays = '7';
    const tp = '3';
    const format = 'json';

    final url = '$baseUrl$endpoint?key=$apiKey&q=$city&num_of_days=$numOfDays&tp=$tp&format=$format';

    try {
    final response = await http.get(Uri.parse(url));
  // print(response);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      // print(data);
      final weatherData = WeatherDataModel.fromJson(data);
      print("am here");
      print(weatherData);
      return Right(weatherData);
    } else {
      // Handle server error with ServerException
      throw ServerException();
    }
  } catch (e) {
    // Handle other exceptions (e.g., network issues) with a Failure
    return Left(NetworkFailure());
  }
  }
}


 main() {
  WeatherRemoteDataSourceImpl w=WeatherRemoteDataSourceImpl(client: http.Client());
  w.getWeather('woliso');

}