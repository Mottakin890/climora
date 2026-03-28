import 'package:climora/data/entities/astro_entities.dart';
import 'package:climora/data/entities/day_entities.dart';
import 'package:climora/data/entities/hour_entities.dart';
import 'package:climora/domain/models/forecast_day_model.dart';

class ForecastDayEntities extends ForecastDayModel {
  ForecastDayEntities({
    required super.date,
    required super.dateEpoch,
    required super.day,
    required super.astro,
    required super.hour,
  });
  factory ForecastDayEntities.fromJson(Map<String, dynamic> json) {
    return ForecastDayEntities(
      date: json['date'] as String? ?? '',
      dateEpoch: json['date_epoch'] as int? ?? 0,
      day: DayEntities.fromJson(json['day'] ?? {}),
      astro: AstroEntities.fromJson(json['astro'] ?? {}),
      hour:
          (json['hour'] as List<dynamic>?)
              ?.map((e) => HourEntities.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'date_epoch': dateEpoch,
      'day': (day as DayEntities).toJson(),
      'astro': (astro as AstroEntities).toJson(),
      'hour': hour.map((e) => (e as HourEntities).toJson()).toList(),
    };
  }
}
