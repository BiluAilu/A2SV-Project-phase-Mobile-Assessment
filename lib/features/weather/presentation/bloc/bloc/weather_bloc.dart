import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/core/utils/functions.dart';
import 'package:weather/features/weather/domain/usecases/search_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  GetWeatherUseCase getWeatherUseCase;

 WeatherState  get initialState=>Empty();
  WeatherBloc({required this.getWeatherUseCase}) : super(Empty(),) {
    on<searchEvent>((event, emit)async {

      emit(Loading());
      final failureOrSearchedWeather=await getWeatherUseCase(GetWeatherParams(city: event.city));
     
       failureOrSearchedWeather.fold((failure){
        emit(Error(message:mapFailerToMessage(failure) ));
    }, (weatherInfo){
        emit(Loaded(weatherInfo: weatherInfo));

    });
    });

  }
}
