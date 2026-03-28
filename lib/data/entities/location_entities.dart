import 'package:climora/domain/models/location_model.dart';

class LocationEntities extends LocationModel {
  LocationEntities({
    required super.name,
    required super.region,
    required super.country,
    required super.lat,
    required super.lon,
    required super.tzId,
    required super.localtimeEpoch,
    required super.localtime,
  });

  factory LocationEntities.fromJson(Map<String, dynamic> json) {
    return LocationEntities(
      name: json['name'] as String? ?? '',
      region: json['region'] as String? ?? '',
      country: json['country'] as String? ?? '',
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      tzId: json['tz_id'] as String? ?? '',
      localtimeEpoch: json['localtime_epoch'] as int? ?? 0,
      localtime: json['localtime'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'region': region,
      'country': country,
      'lat': lat,
      'lon': lon,
      'tz_id': tzId,
      'localtime_epoch': localtimeEpoch,
      'localtime': localtime,
    };
  }
}
