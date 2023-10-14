import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/presentation/bloc/bloc/weather_bloc.dart';

 BlocBuilder<WeatherBloc, WeatherState> WidgetOfBlocBuilder(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              // Handle different WeatherStates and update UI accordingly
              if (state is Loading) {
                return CircularProgressIndicator();
              } else if (state is Loaded) {
                // Display weather information based on state.weatherInfo
                return Text('Weather Info: ${state.weatherInfo}');
              } else if (state is Error) {
                return Text('Error: ${state.message}');
              } else {
                // Default UI when no specific state is available
                return Container();
              }
            },
          );
  }
