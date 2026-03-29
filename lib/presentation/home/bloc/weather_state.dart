part of 'weather_bloc.dart';

sealed class WeatherState {
  const WeatherState();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherState && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

final class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

final class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
  final bool isRefreshing;

  const WeatherLoaded({required this.weather, this.isRefreshing = false});

  WeatherLoaded copyWith({WeatherModel? weather, bool? isRefreshing}) {
    return WeatherLoaded(
      weather: weather ?? this.weather,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherLoaded &&
          runtimeType == other.runtimeType &&
          weather == other.weather &&
          isRefreshing == other.isRefreshing;

  @override
  int get hashCode => weather.hashCode ^ isRefreshing.hashCode;
}

final class WeatherError extends WeatherState {
  final String message;

  const WeatherError({required this.message});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
