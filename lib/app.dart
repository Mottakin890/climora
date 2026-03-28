import 'package:climora/presentation/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

class Climora extends StatelessWidget {
  const Climora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}