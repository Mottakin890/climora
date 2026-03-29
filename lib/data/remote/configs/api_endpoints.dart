class ApiEndpoints {
  const ApiEndpoints._();

  static String apiKey = '';

  static String baseUrl = '';

  static Uri forecastUri({
    required String query,
    int days = 7,
    bool aqi = false,
    bool alerts = false,
  }) => Uri.parse('$baseUrl/forecast.json').replace(
    queryParameters: {
      'key': apiKey,
      'q': query,
      'days': days.toString(),
      'aqi': aqi ? 'yes' : 'no',
      'alerts': alerts ? 'yes' : 'no',
    },
  );

  static Uri currentUri({required String query, bool aqi = false}) =>
      Uri.parse('$baseUrl/current.json').replace(
        queryParameters: {'key': apiKey, 'q': query, 'aqi': aqi ? 'yes' : 'no'},
      );

  static Uri searchUri({required String query}) => Uri.parse(
    '$baseUrl/search.json',
  ).replace(queryParameters: {'key': apiKey, 'q': query});
}
