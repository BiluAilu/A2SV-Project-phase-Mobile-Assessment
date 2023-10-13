import 'dart:convert';
import 'dart:html';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:weather/core/error/exception.dart';
import 'package:weather/features/weather/data/resources/weather_remote_datasource.dart';
import 'package:weather/features/weather/domain/entity/weather.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late WeatherRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
   dataSource=WeatherRemoteDataSourceImpl();
  });

  group('getWeather', () {
    final tCity = 'Addis Ababa';

    test('should perform a GET request on the weather API with the correct parameters', () async {
      // Arrange
      when(mockHttpClient.get(Uri())).thenAnswer((_) async => http.Response('{"key": "value"}', 200));

      // Act
      dataSource.httpClient = mockHttpClient; // Set the mock client
      dataSource.getWeather(tCity);

      // Assert
      verify(mockHttpClient.get(Uri.parse('https://api.worldweatheronline.com/premium/v1/weather.ashx?key=your_api_key&q=$tCity&num_of_days=7&tp=3&format=json')));
    });

    test('should return WeatherData when the response code is 200 (success)', () async {
      // Arrange
      when(mockHttpClient.get(Uri())).thenAnswer((_) async => http.Response('{"key": "value"}', 200));

      // Act
      dataSource.httpClient = mockHttpClient; // Set the mock client
      final result = await dataSource.getWeather(tCity);

      // Assert
      expect(result, isA<WeatherData>());
    });

    test('should throw a ServerException when the response code is not 200', () async {
      // Arrange
      when(mockHttpClient.get(Uri())).thenAnswer((_) async => http.Response('Server Error', 500));

      // Act
      dataSource.httpClient = mockHttpClient; // Set the mock client
      final call = dataSource.getWeather;

      // Assert
      expect(() => call(tCity), throwsA(isA<ServerException>()));
    });
  });
}
