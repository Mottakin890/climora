import 'package:climora/data/remote/services/remote_weather_services.dart';
import 'package:climora/data/repository/api_weather_forecast.dart';
import 'package:climora/domain/repository/weather_repository.dart';
import 'package:climora/domain/usecases/fetch_weather_forecast_usecase.dart';
import 'package:climora/presentation/home/bloc/weather_bloc.dart';
import 'package:climora/presentation/splash/bloc/splash_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(() => WeatherBloc(fetchWeatherForecastUseCase: sl()));
  sl.registerFactory(() => SplashBloc(fetchWeatherForecastUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => FetchWeatherForecastUseCase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<RemoteWeatherDataSource>(
    () => RemoteWeatherDataSourceImpl(client: sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
}
