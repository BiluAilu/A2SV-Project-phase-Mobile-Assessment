part of 'weather_bloc.dart';

 class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

 class Empty extends WeatherState {}

 class Loading extends WeatherState{

}

class Loaded extends WeatherState{
  final weatherInfo;
  Loaded({required this.weatherInfo});
}

class Error extends WeatherState{

  final message;

  Error({required this.message});
}

