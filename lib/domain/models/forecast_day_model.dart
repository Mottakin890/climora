import 'package:climora/domain/models/astro_model.dart';
import 'package:climora/domain/models/day_model.dart';
import 'package:climora/domain/models/hour_model.dart';

class ForecastDayModel {
  final String date;
  final int dateEpoch;
  final DayModel day;
  final AstroModel astro;
  final List<HourModel> hour;

  ForecastDayModel({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });
}
