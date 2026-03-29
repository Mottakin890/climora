import 'package:climora/common/constants/app_colors.dart';
import 'package:climora/presentation/home/bloc/weather_bloc.dart';
import 'package:climora/presentation/home/widgets/weather_background.dart';
import 'package:climora/presentation/home/widgets/weather_error_content.dart';
import 'package:climora/presentation/home/widgets/weather_loaded_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  final String initialLocation;

  const HomeView({super.key, required this.initialLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const WeatherBackground(),
          SafeArea(
            child: BlocSelector<WeatherBloc, WeatherState, (Type, String?)>(
              selector: (state) {
                if (state is WeatherError) return (WeatherError, state.message);
                return (state.runtimeType, null);
              },
              builder: (context, data) {
                final (stateType, errorMessage) = data;

                if (stateType == WeatherLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.white),
                  );
                }

                if (stateType == WeatherError) {
                  return Center(
                    child: WeatherErrorContent(
                      message: errorMessage ?? "Unknown Error",
                      initialLocation: initialLocation,
                    ),
                  );
                }

                if (stateType == WeatherLoaded) {
                  return const WeatherLoadedContent();
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
