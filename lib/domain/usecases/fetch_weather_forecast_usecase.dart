import 'package:climora/domain/models/weather_model.dart';
import 'package:climora/domain/repository/weather_repository.dart';

class FetchWeatherParams {
  final String query;
  final int days;
  final bool aqi;
  final bool alerts;

  const FetchWeatherParams({
    required this.query,
    this.days = 7,
    this.aqi = false,
    this.alerts = false,
  });
}

class FetchWeatherForecastUseCase {
  final WeatherRepository _repository;

  const FetchWeatherForecastUseCase({required WeatherRepository repository})
    : _repository = repository;

  Future<WeatherModel> call(FetchWeatherParams params) {
    return _repository.fetchWeatherForecast(
      query: params.query,
      days: params.days,
      aqi: params.aqi,
      alerts: params.alerts,
    );
  }
}
