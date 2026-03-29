import 'package:climora/domain/models/weather_model.dart';
import 'package:climora/domain/usecases/fetch_weather_forecast_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

final class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final FetchWeatherForecastUseCase _fetchWeatherForecastUseCase;

  WeatherBloc({
    required FetchWeatherForecastUseCase fetchWeatherForecastUseCase,
    WeatherModel? initialWeather,
  }) : _fetchWeatherForecastUseCase = fetchWeatherForecastUseCase,
       super(initialWeather != null
           ? WeatherLoaded(weather: initialWeather)
           : const WeatherInitial()) {
    on<WeatherFetchRequested>(_onFetchRequested);
    on<WeatherRefreshRequested>(_onRefreshRequested);
    on<WeatherInitialSet>((event, emit) {
      emit(WeatherLoaded(weather: event.weather));
    });
  }

  Future<void> _onFetchRequested(
    WeatherFetchRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(const WeatherLoading());
    await _fetchAndEmit(event.query, emit);
  }

  Future<void> _onRefreshRequested(
    WeatherRefreshRequested event,
    Emitter<WeatherState> emit,
  ) async {
    if (state is WeatherLoaded) {
      emit((state as WeatherLoaded).copyWith(isRefreshing: true));
    }
    await _fetchAndEmit(event.query, emit);
  }

  Future<void> _fetchAndEmit(String query, Emitter<WeatherState> emit) async {
    try {
      final weather = await _fetchWeatherForecastUseCase(
        FetchWeatherParams(query: query, days: 7),
      );
      emit(WeatherLoaded(weather: weather));
    } catch (e) {
      emit(WeatherError(message: e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
