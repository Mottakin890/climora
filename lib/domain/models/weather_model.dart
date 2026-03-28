import 'package:climora/domain/models/current_weather_model.dart';
import 'package:climora/domain/models/forecast_model.dart';
import 'package:climora/domain/models/location_model.dart';

class WeatherModel {
  final LocationModel location;
  final CurrentWeatherModel current;
  final ForecastModel forecast;

  WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });
}


