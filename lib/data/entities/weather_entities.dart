import 'package:climora/data/entities/current_weather_entities.dart';
import 'package:climora/data/entities/forecast_entities.dart';
import 'package:climora/data/entities/location_entities.dart';
import 'package:climora/domain/models/weather_model.dart';

class WeatherEntities extends WeatherModel {
  WeatherEntities({
    required super.location,
    required super.current,
    required super.forecast,
  });

  factory WeatherEntities.fromJson(Map<String, dynamic> json) {
    return WeatherEntities(
      location: LocationEntities.fromJson(json['location'] ?? {}),
      current: CurrentWeatherEntities.fromJson(json['current'] ?? {}),
      forecast: ForecastEntities.fromJson(json['forecast'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': (location as LocationEntities).toJson(),
      'current': (current as CurrentWeatherEntities).toJson(),
      'forecast': (forecast as ForecastEntities).toJson(),
    };
  }
}
