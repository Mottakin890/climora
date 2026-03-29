import 'package:climora/domain/models/current_weather_model.dart';
import 'package:climora/domain/models/forecast_model.dart';
import 'package:climora/domain/models/location_model.dart';

class WeatherModel {
  final LocationModel location;
  final CurrentWeatherModel current;
  final ForecastModel forecast;

  const WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModel &&
          runtimeType == other.runtimeType &&
          location == other.location &&
          current == other.current &&
          forecast == other.forecast;

  @override
  int get hashCode => location.hashCode ^ current.hashCode ^ forecast.hashCode;
}
