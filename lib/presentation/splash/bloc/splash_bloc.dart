import 'package:climora/domain/models/weather_model.dart';
import 'package:climora/domain/usecases/fetch_weather_forecast_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final FetchWeatherForecastUseCase _fetchWeatherForecastUseCase;

  SplashBloc({required FetchWeatherForecastUseCase fetchWeatherForecastUseCase})
    : _fetchWeatherForecastUseCase = fetchWeatherForecastUseCase,
      super(const SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
  }

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(const SplashLoading());
    try {
      print("SplashStarted: Handling location...");
      final query = await _handleLocation();
      print("SplashStarted: Location handled, query: $query. Fetching weather...");
      final weather = await _fetchWeatherForecastUseCase(
        FetchWeatherParams(query: query, days: 7),
      );
      print("SplashStarted: Weather fetched successfully. Emitting Success.");
      emit(SplashSuccess(weather: weather));
    } catch (e) {
      print("SplashStarted Error: $e");
      emit(SplashError(message: e.toString()));
    }
  }

  Future<String> _handleLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return "dhaka"; 
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return "dhaka";
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return "dhaka";
    }

    print("HandleLocation: Getting current position...");
    try {
      final position = await Geolocator.getCurrentPosition(
        timeLimit: const Duration(seconds: 15), // Safety timeout
      );
      print("HandleLocation: Got position: $position");
      return "${position.latitude},${position.longitude}";
    } catch (e) {
      print("HandleLocation Exception: $e. Falling back to dhaka.");
      return "dhaka";
    }
  }
}
