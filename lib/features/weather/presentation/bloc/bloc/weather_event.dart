part of 'weather_bloc.dart';

 class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}


class searchEvent extends WeatherEvent{
  final String city;
  searchEvent({required this.city})
;}
