import 'package:climora/common/resources/weather_theme.dart';
import 'package:climora/presentation/home/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherBackground extends StatelessWidget {
  const WeatherBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WeatherBloc, WeatherState, (String, bool)>(
      selector: (state) {
        if (state is WeatherLoaded) {
          return (
            state.weather.current.condition.text,
            state.weather.current.isDay == 1
          );
        }
        return ("Clear", true);
      },
      builder: (context, data) {
        final (condition, isDay) = data;
        return Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: condition.getBackgroundGradient(isDay: isDay),
              ),
            ),
            // Glow artifacts for mesh effect
            Positioned(
              top: -100.h,
              right: -100.w,
              child: Container(
                width: 400.w,
                height: 400.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      (isDay ? Colors.white : Colors.blue.shade900)
                          .withValues(alpha: 0.15),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -50.h,
              left: -50.w,
              child: Container(
                width: 300.w,
                height: 300.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      (isDay ? Colors.cyan : Colors.purple)
                          .withValues(alpha: 0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
