import 'package:climora/common/constants/app_colors.dart';
import 'package:climora/common/dimentions/spacings.dart';
import 'package:climora/common/widgets/glass_container.dart';
import 'package:climora/domain/models/hour_model.dart';
import 'package:climora/presentation/home/bloc/weather_bloc.dart';
import 'package:climora/common/resources/asset_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HourlyForecastList extends StatelessWidget {
  const HourlyForecastList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "HOURLY FORECAST",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            Icon(Icons.query_builder, color: AppColors.white, size: 20.sp),
          ],
        ),
        Spacing.vertical(16),
        SizedBox(
          height: 140.h,
          child: BlocSelector<WeatherBloc, WeatherState, List<HourModel>>(
            selector: (state) {
              if (state is WeatherLoaded) {
                final allHours = state.weather.forecast.forecastday[0].hour;
                final now = DateTime.now().hour;
                return allHours.sublist(now);
              }
              return const [];
            },
            builder: (context, hours) {
              if (hours.isEmpty) return const SizedBox.shrink();

              return RepaintBoundary(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: hours.length,
                  itemBuilder: (context, index) {
                    final isCurrent = index == DateTime.now().hour;
                    return _HourlyItem(
                      hour: hours[index],
                      isCurrent: isCurrent,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _HourlyItem extends StatelessWidget {
  final HourModel hour;
  final bool isCurrent;
  const _HourlyItem({required this.hour, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hourTime = DateTime.fromMillisecondsSinceEpoch(hour.timeEpoch * 1000);
    final isNow = isCurrent && hourTime.hour == now.hour;
    final timeStr = DateFormat('ha').format(hourTime).toLowerCase();

    return RPadding(
      padding: REdgeInsets.only(right: 12),
      child: GlassContainer(
        width: 75.w,
        borderRadius: 40.r,
        opacity: isNow ? 0.4 : 0.05,
        padding: REdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(
              isNow ? "Now" : timeStr,
              style: TextStyle(
                color: isNow ? AppColors.white : AppColors.subtleWhite,
                fontSize: 13.sp,
                fontWeight: isNow ? FontWeight.w900 : FontWeight.w600,
              ),
            ),
            const Spacer(),
            Image.asset(
              hour.condition.text.iconAsset,
              width: 32.w,
              height: 32.h,
            ),
            const Spacer(),
            Text(
              "${hour.tempC.round()}°",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
