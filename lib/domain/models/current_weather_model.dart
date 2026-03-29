import 'package:climora/domain/models/condition_model.dart';

class CurrentWeatherModel {
  final int lastUpdatedEpoch;
  final String lastUpdated;
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
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;

  const CurrentWeatherModel({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
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
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentWeatherModel &&
          runtimeType == other.runtimeType &&
          lastUpdatedEpoch == other.lastUpdatedEpoch &&
          lastUpdated == other.lastUpdated &&
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
          visKm == other.visKm &&
          visMiles == other.visMiles &&
          uv == other.uv &&
          gustMph == other.gustMph &&
          gustKph == other.gustKph;

  @override
  int get hashCode =>
      lastUpdatedEpoch.hashCode ^
      lastUpdated.hashCode ^
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
      visKm.hashCode ^
      visMiles.hashCode ^
      uv.hashCode ^
      gustMph.hashCode ^
      gustKph.hashCode;
}
