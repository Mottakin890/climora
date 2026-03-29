part of 'weather_bloc.dart';

sealed class WeatherEvent {
  const WeatherEvent();
}

final class WeatherFetchRequested extends WeatherEvent {
  final String query;

  const WeatherFetchRequested({required this.query});
}

final class WeatherRefreshRequested extends WeatherEvent {
  final String query;

  const WeatherRefreshRequested({required this.query});
}

final class WeatherSearchQueryChanged extends WeatherEvent {
  final String query;

  const WeatherSearchQueryChanged({required this.query});
}
