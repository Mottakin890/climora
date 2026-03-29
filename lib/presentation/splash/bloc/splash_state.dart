part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

final class SplashInitial extends SplashState {
  const SplashInitial();
}

final class SplashLoading extends SplashState {
  const SplashLoading();
}

final class SplashSuccess extends SplashState {
  final WeatherModel weather;
  const SplashSuccess({required this.weather});

  @override
  List<Object?> get props => [weather];
}

final class SplashError extends SplashState {
  final String message;
  const SplashError({required this.message});

  @override
  List<Object?> get props => [message];
}
