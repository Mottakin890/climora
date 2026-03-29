import 'package:climora/domain/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> fetchWeatherForecast({
    required String query,
    int days = 7,
    bool aqi = false,
    bool alerts = false,
  });
}
