import 'package:climora/common/dimentions/spacings.dart';
import 'package:climora/presentation/home/bloc/weather_bloc.dart';
import 'package:climora/presentation/home/widgets/current_weather_info.dart';
import 'package:climora/presentation/home/widgets/home_header.dart';
import 'package:climora/presentation/home/widgets/hourly_forecast_list.dart';
import 'package:climora/presentation/home/widgets/weather_details_grid.dart';
import 'package:climora/presentation/home/widgets/weekly_forecast_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherLoadedContent extends StatelessWidget {
  const WeatherLoadedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final state = context.read<WeatherBloc>().state;
        if (state is WeatherLoaded) {
          context.read<WeatherBloc>().add(
            WeatherRefreshRequested(query: state.weather.location.name),
          );
        }
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacing.vertical(10),
            _AnimatedSection(delay: 0, child: const HomeHeader()),
            _AnimatedSection(delay: 200, child: const CurrentWeatherInfo()),
            Spacing.vertical(40),
            _AnimatedSection(delay: 400, child: const WeatherDetailsGrid()),
            Spacing.vertical(40),
            _AnimatedSection(delay: 600, child: const HourlyForecastList()),
            Spacing.vertical(40),
            _AnimatedSection(delay: 800, child: const WeeklyForecastList()),
            Spacing.vertical(40),
          ],
        ),
      ),
    );
  }
}

class _AnimatedSection extends StatefulWidget {
  final Widget child;
  final int delay;

  const _AnimatedSection({required this.child, required this.delay});

  @override
  State<_AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<_AnimatedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(position: _slideAnimation, child: widget.child),
    );
  }
}
