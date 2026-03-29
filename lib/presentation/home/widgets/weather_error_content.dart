import 'package:climora/common/constants/app_colors.dart';
import 'package:climora/common/dimentions/spacings.dart';
import 'package:climora/common/widgets/glass_container.dart';
import 'package:climora/presentation/home/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherErrorContent extends StatelessWidget {
  final String message;
  final String initialLocation;
  const WeatherErrorContent({
    super.key,
    required this.message,
    required this.initialLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(32),
      child: GlassContainer(
        padding: REdgeInsets.all(32),
        borderRadius: 32.r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: AppColors.error,
              size: 50.sp,
            ),
            Spacing.vertical(20),
            Text(
              "Something went wrong",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            Spacing.vertical(10),
            Text(
              message,
              style: TextStyle(
                color: AppColors.subtleWhite,
                fontSize: 14.sp,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            Spacing.vertical(24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.read<WeatherBloc>().add(
                      WeatherFetchRequested(query: initialLocation),
                    ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white.withValues(alpha: 0.1),
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  padding: REdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    side: BorderSide(
                      color: AppColors.white.withValues(alpha: 0.2),
                    ),
                  ),
                ),
                child: Text(
                  "RETRY",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
