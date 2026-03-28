import 'package:climora/data/entities/forecast_day_entities.dart';
import 'package:climora/domain/models/forecast_model.dart';

class ForecastEntities extends ForecastModel {
  ForecastEntities({required super.forecastday});
  factory ForecastEntities.fromJson(Map<String, dynamic> json) {
    return ForecastEntities(
      forecastday:
          (json['forecastday'] as List<dynamic>?)
              ?.map(
                (e) => ForecastDayEntities.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'forecastday': forecastday.map((e) => (e as ForecastDayEntities).toJson()).toList()};
  }
}
