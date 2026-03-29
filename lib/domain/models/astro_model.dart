class AstroModel {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final int moonIllumination;
  final int isMoonUp;
  final int isSunUp;

  const AstroModel({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AstroModel &&
          runtimeType == other.runtimeType &&
          sunrise == other.sunrise &&
          sunset == other.sunset &&
          moonrise == other.moonrise &&
          moonset == other.moonset &&
          moonPhase == other.moonPhase &&
          moonIllumination == other.moonIllumination &&
          isMoonUp == other.isMoonUp &&
          isSunUp == other.isSunUp;

  @override
  int get hashCode =>
      sunrise.hashCode ^
      sunset.hashCode ^
      moonrise.hashCode ^
      moonset.hashCode ^
      moonPhase.hashCode ^
      moonIllumination.hashCode ^
      isMoonUp.hashCode ^
      isSunUp.hashCode;
}
