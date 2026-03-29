import 'package:climora/domain/models/astro_model.dart';
import 'package:climora/domain/models/day_model.dart';
import 'package:climora/domain/models/hour_model.dart';

class ForecastDayModel {
  final String date;
  final int dateEpoch;
  final DayModel day;
  final AstroModel astro;
  final List<HourModel> hour;

  const ForecastDayModel({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! ForecastDayModel || runtimeType != other.runtimeType) {
      return false;
    }

    if (date != other.date ||
        dateEpoch != other.dateEpoch ||
        day != other.day ||
        astro != other.astro ||
        hour.length != other.hour.length) {
      return false;
    }

    for (int i = 0; i < hour.length; i++) {
      if (hour[i] != other.hour[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    int res = date.hashCode ^ dateEpoch.hashCode ^ day.hashCode ^ astro.hashCode;
    for (final element in hour) {
      res = res ^ element.hashCode;
    }
    return res;
  }
}
