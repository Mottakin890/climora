import 'package:climora/data/remote/services/remote_weather_services.dart';
import 'package:climora/domain/models/weather_model.dart';
import 'package:climora/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteWeatherDataSource _remoteDataSource;

  const WeatherRepositoryImpl({
    required RemoteWeatherDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<WeatherModel> fetchWeatherForecast({
    required String query,
    int days = 7,
    bool aqi = false,
    bool alerts = false,
  }) async {
    final result = await _remoteDataSource.fetchWeatherForecast(
      query: query,
      days: days,
      aqi: aqi,
      alerts: alerts,
    );
    return result.fold(
      (exception) => throw exception,
      (weatherModel) => weatherModel,
    );
  }
}
