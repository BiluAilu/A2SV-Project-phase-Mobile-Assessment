

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures.dart';
import 'package:weather/features/weather/data/model/weather_model.dart';
import 'package:weather/features/weather/domain/entity/weather.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

abstract class WeatherRemoteDataSource {
  Future<Either<Failure, WeatherData>> getWeather(String city);

}





class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final String baseUrl="https://api.worldweatheronline.com"; // Add the base URL of your weather API here
  final String apiKey="68da0c21ae6d455e91771733231110"; // Add your API key here
 late http.Client httpClient; // Define httpClient

  
  @override
  Future<Either<Failure, WeatherData>> getWeather(String city) async {
    const endpoint = '/premium/v1/weather.ashx'; // Adjust this based on your API
    const numOfDays = '7';
    const tp = '3';
    const format = 'json';

    final url = '$baseUrl$endpoint?key=$apiKey&q=$city&num_of_days=$numOfDays&tp=$tp&format=$format';

    try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final weatherData = WeatherDataModel.fromJson(data);
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
