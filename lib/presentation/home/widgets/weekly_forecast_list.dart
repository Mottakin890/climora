import 'package:climora/common/constants/app_colors.dart';
import 'package:climora/common/dimentions/spacings.dart';
import 'package:climora/common/widgets/glass_container.dart';
import 'package:climora/domain/models/forecast_day_model.dart';
import 'package:climora/presentation/home/bloc/weather_bloc.dart';
import 'package:climora/common/resources/asset_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WeeklyForecastList extends StatelessWidget {
  const WeeklyForecastList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "7-DAY FORECAST",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            Icon(Icons.calendar_today_outlined,
                color: AppColors.white, size: 20.sp),
          ],
        ),
        Spacing.vertical(16),
        BlocSelector<WeatherBloc, WeatherState, List<ForecastDayModel>>(
          selector: (state) {
            if (state is WeatherLoaded) return state.weather.forecast.forecastday;
            return [];
          },
          builder: (context, forecastDays) {
            if (forecastDays.isEmpty) return const SizedBox.shrink();

            return GlassContainer(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: RepaintBoundary(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: forecastDays.length,
                  separatorBuilder: (context, index) => Divider(
                    color: AppColors.white.withValues(alpha: 0.1),
                    height: 24.h,
                  ),
                  itemBuilder: (context, index) {
                    return _WeeklyItem(
                      index: index,
                      dayData: forecastDays[index],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _WeeklyItem extends StatelessWidget {
  final int index;
  final ForecastDayModel dayData;
  const _WeeklyItem({required this.index, required this.dayData});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMillisecondsSinceEpoch(dayData.dateEpoch * 1000);
    final dayName = index == 0 ? "Today" : DateFormat('EEEE').format(date);

    return Padding(
      padding: REdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              dayName,
              style: TextStyle(
                color: index == 0 ? AppColors.white : AppColors.subtleWhite,
                fontSize: 16.sp,
                fontWeight: index == 0 ? FontWeight.w900 : FontWeight.w600,
              ),
            ),
          ),
          Image.asset(
            dayData.day.condition.text.iconAsset,
            width: 32.w,
            height: 32.h,
          ),
          Spacing.horizontal(12),
          Text(
            "${dayData.day.mintempC.round()}°",
            style: TextStyle(
              color: AppColors.subtleWhite,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacing.horizontal(8),
          Expanded(
            child: Container(
              height: 4.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.r),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withValues(alpha: 0.3),
                    Colors.orange.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
          ),
          Spacing.horizontal(8),
          Text(
            "${dayData.day.maxtempC.round()}°",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
