import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

extension WeatherTheme on String {
  LinearGradient getBackgroundGradient({bool isDay = true}) {
    final condition = toLowerCase();
    if (!isDay) return AppColors.skyGradientNight;
    
    if (condition.contains('rain') || condition.contains('drizzle') || condition.contains('storm')) {
      return AppColors.skyGradientRainy;
    }
    
    return AppColors.skyGradientDay;
  }
}
