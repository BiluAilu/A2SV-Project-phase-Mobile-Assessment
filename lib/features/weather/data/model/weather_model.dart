import 'package:weather/features/weather/domain/entity/weather.dart';



class WeatherDataModel extends WeatherData {

 WeatherDataModel({required super.currentWeatherDesc,required super.currentTempC,required super.next6Days});
  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    final currentCondition = json['data']['current_condition'][0];
    final currentWeatherDesc = currentCondition['weatherDesc'][0]['value'];
    final currentTempC = int.parse(currentCondition['temp_C']);

    final next6Days = List<WeatherDay>.from(
      json['data']['weather'].sublist(1, 7).map((day) => WeatherDataModel.fromJson(day)),
    );
  print(next6Days);
    return WeatherDataModel(
      currentWeatherDesc: currentWeatherDesc,
      currentTempC: currentTempC,
      next6Days: next6Days,
    );
  }
}

class WeatherDayModel extends WeatherDay {
  WeatherDayModel({
    required String date,
    required int maxTempC,
    required int minTempC,
    required String weatherDesc,
    required String weatherIconUrl,
  }) : super(
          date: date,
          maxTempC: maxTempC,
          minTempC: minTempC,
          weatherDesc: weatherDesc,
          weatherIconUrl: weatherIconUrl,
        );

  factory WeatherDayModel.fromJson(Map<String, dynamic> json) {
    final weatherDesc = json['maxtempC'];
    final maxTempC = int.parse(json['maxtempC']);
    final minTempC = int.parse(json['mintempC']);
    final weatherIconUrl = json['weatherIconUrl'][0]['value'];

    return WeatherDayModel(
      date: json['date'],
      maxTempC: maxTempC,
      minTempC: minTempC,
      weatherDesc: weatherDesc,
      weatherIconUrl: weatherIconUrl,
    );
  }
}
