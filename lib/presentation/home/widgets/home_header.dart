import 'package:climora/common/constants/app_colors.dart';
import 'package:climora/common/dimentions/spacings.dart';
import 'package:climora/presentation/home/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WeatherBloc, WeatherState, (String, bool)>(
      selector: (state) => state is WeatherLoaded ? (state.weather.location.name, state.isRefreshing) : ("", false),
      builder: (context, data) {
        final (location, isRefreshing) = data;
        if (location.isEmpty) return const SizedBox.shrink();

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: AppColors.white.withValues(alpha: 0.9), size: 24.sp),
                SizedBox(width: 8.w),
                Flexible(
                  child: Text(
                    location.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 4.sp,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Spacing.vertical(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('EEEE, d MMMM').format(DateTime.now()),
                  style: TextStyle(
                    color: AppColors.offWhite,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (isRefreshing) ...[
                  SizedBox(width: 12.w),
                  SizedBox(
                    width: 12.w,
                    height: 12.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.w,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ],
            ),
          ],
        );
      },
    );
  }
}
