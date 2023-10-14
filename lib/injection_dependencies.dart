import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:http/http.dart' as http;
import 'package:weather/core/network/network_info.dart';
import 'package:weather/features/weather/data/repository/weather_repository_imp.dart';
import 'package:weather/features/weather/data/resources/weather_remote_datasource.dart';
import 'package:weather/features/weather/domain/repository/weather_repository.dart';
import 'package:weather/features/weather/domain/usecases/search_weather_usecase.dart';
import 'package:weather/features/weather/presentation/bloc/bloc/weather_bloc.dart';


final sl=GetIt.instance;

Future<void> init()async{

// ! Features

// * First let's register the bloc


sl.registerFactory(() => WeatherBloc(getWeatherUseCase: sl()));

// * Then let's register Usecases


// ? And remember to to use registerFactory() for bloc register only , but for the rest let's try to use just registerLazySingleton() or registerSingleton();

sl.registerLazySingleton(() =>GetWeatherUseCase(repository:  sl()));

// * Repository 

sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl( remoteDataSource: sl(), networkInfo: sl()));


// * Data sources

sl.registerLazySingleton<WeatherRemoteDataSource>(() => WeatherRemoteDataSourceImpl(client: sl()));

// ! Core
// * Network
sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

// ! External (Packages)

sl.registerLazySingleton(() => http.Client());
sl.registerLazySingleton(() => InternetConnectionChecker());




}