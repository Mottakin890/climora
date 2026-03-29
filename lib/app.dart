import 'package:climora/common/di/injection.dart';
import 'package:climora/presentation/splash/bloc/splash_bloc.dart';
import 'package:climora/presentation/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Climora extends StatelessWidget {
  const Climora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0E21), // AppColors.deepNavy
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      home: BlocProvider(
        create: (_) => sl<SplashBloc>()..add(const SplashStarted()),
        child: const SplashView(),
      ),
    );
  }
}