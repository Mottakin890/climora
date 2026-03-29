import 'dart:developer' as dev;
import 'package:climora/common/resources/app_assets.dart';
import 'package:climora/common/constants/app_colors.dart';
import 'package:climora/presentation/home/bloc/weather_bloc.dart';
import 'package:climora/presentation/home/view/home_view.dart';
import 'package:climora/presentation/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccess) {
          dev.log("SplashView: Navigation triggered. To Home...",
              name: 'SplashView');
          context
              .read<WeatherBloc>()
              .add(WeatherInitialSet(weather: state.weather));
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) =>
                  HomeView(initialLocation: state.weather.location.name),
            ),
          );
        } else if (state is SplashError) {
          dev.log("SplashView: Error detected: ${state.message}", name: 'SplashView');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.redAccent,
              duration: const Duration(seconds: 5),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.deepNavy,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.sunny,
                width: 150.w,
                height: 150.h,
              ),
              SizedBox(height: 20.h),
              Text(
                "CLIMORA",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}