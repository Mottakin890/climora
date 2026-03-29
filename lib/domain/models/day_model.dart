import 'package:climora/domain/models/condition_model.dart';

class DayModel {
  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final double maxwindMph;
  final double maxwindKph;
  final double totalprecipMm;
  final double totalprecipIn;
  final double totalsnowCm;
  final double avgvisKm;
  final double avgvisMiles;
  final double avghumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final ConditionModel condition;
  final double uv;

  const DayModel({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayModel &&
          runtimeType == other.runtimeType &&
          maxtempC == other.maxtempC &&
          maxtempF == other.maxtempF &&
          mintempC == other.mintempC &&
          mintempF == other.mintempF &&
          avgtempC == other.avgtempC &&
          avgtempF == other.avgtempF &&
          maxwindMph == other.maxwindMph &&
          maxwindKph == other.maxwindKph &&
          totalprecipMm == other.totalprecipMm &&
          totalprecipIn == other.totalprecipIn &&
          totalsnowCm == other.totalsnowCm &&
          avgvisKm == other.avgvisKm &&
          avgvisMiles == other.avgvisMiles &&
          avghumidity == other.avghumidity &&
          dailyWillItRain == other.dailyWillItRain &&
          dailyChanceOfRain == other.dailyChanceOfRain &&
          dailyWillItSnow == other.dailyWillItSnow &&
          dailyChanceOfSnow == other.dailyChanceOfSnow &&
          condition == other.condition &&
          uv == other.uv;

  @override
  int get hashCode =>
      maxtempC.hashCode ^
      maxtempF.hashCode ^
      mintempC.hashCode ^
      mintempF.hashCode ^
      avgtempC.hashCode ^
      avgtempF.hashCode ^
      maxwindMph.hashCode ^
      maxwindKph.hashCode ^
      totalprecipMm.hashCode ^
      totalprecipIn.hashCode ^
      totalsnowCm.hashCode ^
      avgvisKm.hashCode ^
      avgvisMiles.hashCode ^
      avghumidity.hashCode ^
      dailyWillItRain.hashCode ^
      dailyChanceOfRain.hashCode ^
      dailyWillItSnow.hashCode ^
      dailyChanceOfSnow.hashCode ^
      condition.hashCode ^
      uv.hashCode;
}
