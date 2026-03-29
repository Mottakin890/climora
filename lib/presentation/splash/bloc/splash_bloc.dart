import 'dart:developer' as dev;
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
      dev.log("SplashStarted: Handling location...", name: 'SplashBloc');
      final query = await _handleLocation();
      dev.log("SplashStarted: Location handled, query: $query. Fetching weather...", name: 'SplashBloc');
      final weather = await _fetchWeatherForecastUseCase(
        FetchWeatherParams(query: query, days: 7),
      );
      dev.log("SplashStarted: Weather fetched successfully. Emitting Success.", name: 'SplashBloc');
      emit(SplashSuccess(weather: weather));
    } catch (e) {
      dev.log("SplashStarted Error: $e", name: 'SplashBloc', error: e);
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

    dev.log("HandleLocation: Getting current position...", name: 'SplashBloc');
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );
      dev.log("HandleLocation: Got position: $position", name: 'SplashBloc');
      return "${position.latitude},${position.longitude}";
    } catch (e) {
      dev.log("HandleLocation Exception: $e. Falling back to dhaka.", name: 'SplashBloc', error: e);
      return "dhaka";
    }
  }
}
