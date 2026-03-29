class LocationModel {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  const LocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          region == other.region &&
          country == other.country &&
          lat == other.lat &&
          lon == other.lon &&
          tzId == other.tzId &&
          localtimeEpoch == other.localtimeEpoch &&
          localtime == other.localtime;

  @override
  int get hashCode =>
      name.hashCode ^
      region.hashCode ^
      country.hashCode ^
      lat.hashCode ^
      lon.hashCode ^
      tzId.hashCode ^
      localtimeEpoch.hashCode ^
      localtime.hashCode;
}
