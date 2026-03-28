import 'package:climora/data/entities/condition_entities.dart';
import 'package:climora/domain/models/day_model.dart';

class DayEntities extends DayModel {
  DayEntities({
    required super.maxtempC,
    required super.maxtempF,
    required super.mintempC,
    required super.mintempF,
    required super.avgtempC,
    required super.avgtempF,
    required super.maxwindMph,
    required super.maxwindKph,
    required super.totalprecipMm,
    required super.totalprecipIn,
    required super.totalsnowCm,
    required super.avgvisKm,
    required super.avgvisMiles,
    required super.avghumidity,
    required super.dailyWillItRain,
    required super.dailyChanceOfRain,
    required super.dailyWillItSnow,
    required super.dailyChanceOfSnow,
    required super.condition,
    required super.uv,
  });

  factory DayEntities.fromJson(Map<String, dynamic> json) {
    return DayEntities(
      maxtempC: (json['maxtemp_c'] as num?)?.toDouble() ?? 0.0,
      maxtempF: (json['maxtemp_f'] as num?)?.toDouble() ?? 0.0,
      mintempC: (json['mintemp_c'] as num?)?.toDouble() ?? 0.0,
      mintempF: (json['mintemp_f'] as num?)?.toDouble() ?? 0.0,
      avgtempC: (json['avgtemp_c'] as num?)?.toDouble() ?? 0.0,
      avgtempF: (json['avgtemp_f'] as num?)?.toDouble() ?? 0.0,
      maxwindMph: (json['maxwind_mph'] as num?)?.toDouble() ?? 0.0,
      maxwindKph: (json['maxwind_kph'] as num?)?.toDouble() ?? 0.0,
      totalprecipMm: (json['totalprecip_mm'] as num?)?.toDouble() ?? 0.0,
      totalprecipIn: (json['totalprecip_in'] as num?)?.toDouble() ?? 0.0,
      totalsnowCm: (json['totalsnow_cm'] as num?)?.toDouble() ?? 0.0,
      avgvisKm: (json['avgvis_km'] as num?)?.toDouble() ?? 0.0,
      avgvisMiles: (json['avgvis_miles'] as num?)?.toDouble() ?? 0.0,
      avghumidity: (json['avghumidity'] as num?)?.toDouble() ?? 0.0,
      dailyWillItRain: json['daily_will_it_rain'] as int? ?? 0,
      dailyChanceOfRain: json['daily_chance_of_rain'] as int? ?? 0,
      dailyWillItSnow: json['daily_will_it_snow'] as int? ?? 0,
      dailyChanceOfSnow: json['daily_chance_of_snow'] as int? ?? 0,
      condition: ConditionEntities.fromJson(json['condition'] ?? {}),
      uv: (json['uv'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maxtemp_c': maxtempC,
      'maxtemp_f': maxtempF,
      'mintemp_c': mintempC,
      'mintemp_f': mintempF,
      'avgtemp_c': avgtempC,
      'avgtemp_f': avgtempF,
      'maxwind_mph': maxwindMph,
      'maxwind_kph': maxwindKph,
      'totalprecip_mm': totalprecipMm,
      'totalprecip_in': totalprecipIn,
      'totalsnow_cm': totalsnowCm,
      'avgvis_km': avgvisKm,
      'avgvis_miles': avgvisMiles,
      'avghumidity': avghumidity,
      'daily_will_it_rain': dailyWillItRain,
      'daily_chance_of_rain': dailyChanceOfRain,
      'daily_will_it_snow': dailyWillItSnow,
      'daily_chance_of_snow': dailyChanceOfSnow,
      'condition': (condition as ConditionEntities).toJson(),
      'uv': uv,
    };
  }
}
