import 'package:climora/common/constants/app_colors.dart';
import 'package:climora/common/dimentions/spacings.dart';
import 'package:climora/common/widgets/glass_container.dart';
import 'package:climora/domain/models/current_weather_model.dart';
import 'package:climora/presentation/home/bloc/weather_bloc.dart';
import 'package:climora/common/resources/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherDetailsGrid extends StatelessWidget {
  const WeatherDetailsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WeatherBloc, WeatherState, CurrentWeatherModel?>(
      selector: (state) => state is WeatherLoaded ? state.weather.current : null,
      builder: (context, current) {
        if (current == null) return const SizedBox.shrink();

        return RepaintBoundary(
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 16.sp,
            mainAxisSpacing: 16.sp,
            children: [
              _DetailItem(
                icon: AppAssets.humidity,
                label: "HUMIDITY",
                value: "${current.humidity.round()}%",
              ),
              _DetailItem(
                icon: AppAssets.windspeed,
                label: "WIND",
                value: "${current.windKph.round()} km/h",
              ),
              _DetailItem(
                icon: AppAssets.sunny,
                label: "UV INDEX",
                value: "${current.uv.round()}",
              ),
              _DetailItem(
                icon: AppAssets.mist,
                label: "FEELS LIKE",
                value: "${current.feelslikeC.round()}°",
              ),
              _DetailItem(
                icon: AppAssets.partlycloudy,
                label: "PRECIPITATION",
                value: "${current.precipMm.round()} mm",
              ),
              _DetailItem(
                icon: AppAssets.overcast,
                label: "PRESSURE",
                value: "${current.pressureMb.round()} mb",
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  const _DetailItem({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: REdgeInsets.all(16),
      borderRadius: 28.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                icon,
                width: 20.w,
                height: 20.h,
                color: AppColors.white.withValues(alpha: 0.7),
              ),
              Spacing.horizontal(8),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.subtleWhite,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
