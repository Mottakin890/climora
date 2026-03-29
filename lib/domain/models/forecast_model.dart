import 'package:climora/domain/models/forecast_day_model.dart';

class ForecastModel {
  final List<ForecastDayModel> forecastday;

  const ForecastModel({required this.forecastday});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForecastModel || runtimeType != other.runtimeType) return false;
    
    if (forecastday.length != other.forecastday.length) return false;
    for (int i = 0; i < forecastday.length; i++) {
      if (forecastday[i] != other.forecastday[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode {
    int result = 0;
    for (final element in forecastday) {
      result = result ^ element.hashCode;
    }
    return result;
  }
}
