import 'package:climora/domain/models/astro_model.dart';

class AstroEntities extends AstroModel {
  AstroEntities({
    required super.sunrise,
    required super.sunset,
    required super.moonrise,
    required super.moonset,
    required super.moonPhase,
    required super.moonIllumination,
    required super.isMoonUp,
    required super.isSunUp,
  });

  factory AstroEntities.fromJson(Map<String, dynamic> json) {
    return AstroEntities(
      sunrise: json['sunrise'] as String? ?? '',
      sunset: json['sunset'] as String? ?? '',
      moonrise: json['moonrise'] as String? ?? '',
      moonset: json['moonset'] as String? ?? '',
      moonPhase: json['moon_phase'] as String? ?? '',
      moonIllumination: json['moon_illumination'] as int? ?? 0,
      isMoonUp: json['is_moon_up'] as int? ?? 0,
      isSunUp: json['is_sun_up'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moon_phase': moonPhase,
      'moon_illumination': moonIllumination,
      'is_moon_up': isMoonUp,
      'is_sun_up': isSunUp,
    };
  }
}
