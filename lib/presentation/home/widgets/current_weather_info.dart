import 'package:climora/common/constants/app_colors.dart';
import 'package:climora/common/dimentions/spacings.dart';
import 'package:climora/presentation/home/bloc/weather_bloc.dart';
import 'package:climora/common/resources/asset_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentWeatherInfo extends StatelessWidget {
  const CurrentWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WeatherBloc, WeatherState, (double, String, double, double)?>(
      selector: (state) {
        if (state is WeatherLoaded) {
          final cur = state.weather.current;
          final day = state.weather.forecast.forecastday[0].day;
          return (cur.tempC, cur.condition.text, day.maxtempC, day.mintempC);
        }
        return null;
      },
      builder: (context, data) {
        if (data == null) return const SizedBox.shrink();

        final (temp, condition, high, low) = data;

        return RepaintBoundary(
          child: Column(
            key: const ValueKey('current_weather_info_column'),
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 250.w,
                    height: 250.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.white.withValues(alpha: 0.15),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    condition.iconAsset,
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              Spacing.vertical(8),
              Text(
                "${temp.round()}°",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 70.sp,
                  fontWeight: FontWeight.w700,
                  height: 1,
                  letterSpacing: -2,
                ),
              ),
              Text(
                condition.toUpperCase(),
                style: TextStyle(
                  color: AppColors.offWhite,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 4,
                ),
              ),
              Spacing.vertical(12),
              Text(
                "H:${high.round()}°  L:${low.round()}°",
                style: TextStyle(
                  color: AppColors.subtleWhite,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
