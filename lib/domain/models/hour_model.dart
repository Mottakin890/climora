

import 'package:climora/domain/models/condition_model.dart';

class HourModel {
  final int timeEpoch;
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final ConditionModel condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final double snowCm;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final int willItRain;
  final int chanceOfRain;
  final int willItSnow;
  final int chanceOfSnow;
  final double visKm;
  final double visMiles;
  final double gustMph;
  final double gustKph;
  final double uv;
  final double shortRad;
  final double diffRad;
  final double dni;
  final double gti;

  const HourModel({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.snowCm,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
    required this.shortRad,
    required this.diffRad,
    required this.dni,
    required this.gti,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourModel &&
          runtimeType == other.runtimeType &&
          timeEpoch == other.timeEpoch &&
          time == other.time &&
          tempC == other.tempC &&
          tempF == other.tempF &&
          isDay == other.isDay &&
          condition == other.condition &&
          windMph == other.windMph &&
          windKph == other.windKph &&
          windDegree == other.windDegree &&
          windDir == other.windDir &&
          pressureMb == other.pressureMb &&
          pressureIn == other.pressureIn &&
          precipMm == other.precipMm &&
          precipIn == other.precipIn &&
          snowCm == other.snowCm &&
          humidity == other.humidity &&
          cloud == other.cloud &&
          feelslikeC == other.feelslikeC &&
          feelslikeF == other.feelslikeF &&
          windchillC == other.windchillC &&
          windchillF == other.windchillF &&
          heatindexC == other.heatindexC &&
          heatindexF == other.heatindexF &&
          dewpointC == other.dewpointC &&
          dewpointF == other.dewpointF &&
          willItRain == other.willItRain &&
          chanceOfRain == other.chanceOfRain &&
          willItSnow == other.willItSnow &&
          chanceOfSnow == other.chanceOfSnow &&
          visKm == other.visKm &&
          visMiles == other.visMiles &&
          gustMph == other.gustMph &&
          gustKph == other.gustKph &&
          uv == other.uv &&
          shortRad == other.shortRad &&
          diffRad == other.diffRad &&
          dni == other.dni &&
          gti == other.gti;

  @override
  int get hashCode =>
      timeEpoch.hashCode ^
      time.hashCode ^
      tempC.hashCode ^
      tempF.hashCode ^
      isDay.hashCode ^
      condition.hashCode ^
      windMph.hashCode ^
      windKph.hashCode ^
      windDegree.hashCode ^
      windDir.hashCode ^
      pressureMb.hashCode ^
      pressureIn.hashCode ^
      precipMm.hashCode ^
      precipIn.hashCode ^
      snowCm.hashCode ^
      humidity.hashCode ^
      cloud.hashCode ^
      feelslikeC.hashCode ^
      feelslikeF.hashCode ^
      windchillC.hashCode ^
      windchillF.hashCode ^
      heatindexC.hashCode ^
      heatindexF.hashCode ^
      dewpointC.hashCode ^
      dewpointF.hashCode ^
      willItRain.hashCode ^
      chanceOfRain.hashCode ^
      willItSnow.hashCode ^
      chanceOfSnow.hashCode ^
      visKm.hashCode ^
      visMiles.hashCode ^
      gustMph.hashCode ^
      gustKph.hashCode ^
      uv.hashCode ^
      shortRad.hashCode ^
      diffRad.hashCode ^
      dni.hashCode ^
      gti.hashCode;
}
