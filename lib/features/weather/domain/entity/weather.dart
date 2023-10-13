
import 'package:equatable/equatable.dart';

class WeatherData extends Equatable {
  final String currentWeatherDesc;
  final int currentTempC;
  final List<WeatherDay> next6Days;

  WeatherData({
    required this.currentWeatherDesc,
    required this.currentTempC,
    required this.next6Days,
  });

  @override
  List<Object?> get props => [currentWeatherDesc, currentTempC, next6Days];
}

class WeatherDay extends Equatable {
  final String date;
  final int maxTempC;
  final int minTempC;
  final String weatherDesc;
  final String weatherIconUrl;

  WeatherDay({
    required this.date,
    required this.maxTempC,
    required this.minTempC,
    required this.weatherDesc,
    required this.weatherIconUrl,
  });

  @override
  List<Object?> get props => [date, maxTempC, minTempC, weatherDesc, weatherIconUrl];
}
