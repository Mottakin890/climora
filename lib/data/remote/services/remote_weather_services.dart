import 'dart:convert';
import 'dart:io';
import 'package:climora/data/entities/weather_entities.dart';
import 'package:climora/data/remote/configs/api_endpoints.dart';
import 'package:climora/domain/models/weather_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class RemoteWeatherDataSource {
  Future<Either<Exception, WeatherModel>> fetchWeatherForecast({
    required String query,
    int days = 7,
    bool aqi = false,
    bool alerts = false,
  });
}

class RemoteWeatherDataSourceImpl implements RemoteWeatherDataSource {
  final http.Client _client;

  RemoteWeatherDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<Either<Exception, WeatherModel>> fetchWeatherForecast({
    required String query,
    int days = 7,
    bool aqi = false,
    bool alerts = false,
  }) async {
    try {
      final uri = ApiEndpoints.forecastUri(
        query: query,
        days: days,
        aqi: aqi,
        alerts: alerts,
      );

      final response = await _client.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );

      return _handleResponse(response);
    } on SocketException {
      return Left(
        Exception('No internet connection. Please check your network.'),
      );
    } on HttpException catch (e) {
      return Left(Exception('HTTP error: ${e.message}'));
    } on FormatException catch (e) {
      return Left(Exception('Invalid response format: ${e.message}'));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }

  Either<Exception, WeatherModel> _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return _parseWeatherData(response.body);

      case 400:
        return Left(
          Exception(_extractApiError(response.body) ?? 'Bad request (400).'),
        );

      case 401:
        return Left(
          Exception('Invalid API key (401). Check your WEATHER_API_KEY.'),
        );

      case 403:
        return Left(
          Exception('Access denied (403). API key may be disabled.'),
        );

      case 404:
        return Left(
          Exception(
            _extractApiError(response.body) ?? 'Location not found (404).',
          ),
        );

      case 429:
        return Left(
          Exception('Rate limit exceeded (429). Please wait before retrying.'),
        );

      case 503:
        return Left(
          Exception(
            'WeatherAPI service unavailable (503). Try again later.',
          ),
        );

      default:
        return Left(
          Exception(
            'Unexpected status code: ${response.statusCode}. '
            'Body: ${response.body}',
          ),
        );
    }
  }

  Either<Exception, WeatherModel> _parseWeatherData(String body) {
    try {
      final json = jsonDecode(body) as Map<String, dynamic>;
      final weather = WeatherEntities.fromJson(json);
      return Right(weather);
    } on FormatException catch (e) {
      return Left(Exception('JSON parse error: ${e.message}'));
    } catch (e) {
      return Left(Exception('Failed to map weather data: $e'));
    }
  }

  String? _extractApiError(String body) {
    try {
      final json = jsonDecode(body) as Map<String, dynamic>;
      final error = json['error'] as Map<String, dynamic>?;
      return error?['message'] as String?;
    } catch (_) {
      return null;
    }
  }
}
