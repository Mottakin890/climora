import 'package:climora/app.dart';
import 'package:climora/common/di/injection.dart' as di;

import 'package:climora/data/remote/configs/api_endpoints.dart';
import 'package:climora/common/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:developer' as developer;

void main(List<String> args) async {
  await _init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    return runApp(
      const ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: Climora(),
      ),
    );
  });
}

Future<void> _setDeployment(Deployment deployment) async {
  print("SetDeployment: Loading .env...");
  await dotenv.load(fileName: ".env");
  print("SetDeployment: .env loaded.");
  try {
    ApiEndpoints.baseUrl = (deployment == Deployment.production)
        ? dotenv.env['PRODUCTION_BASE_URL']!
        : dotenv.env['STAGING_BASE_URL']!;

    ApiEndpoints.apiKey = (deployment == Deployment.production)
        ? dotenv.env['PRODUCTION_API_KEY']!
        : dotenv.env['STAGING_API_KEY']!;
    print("SetDeployment: ApiEndpoints configured for Production.");
  } catch (e) {
    print("SetDeployment Error while accessing .env: $e");
    developer.log(e.toString());
  }
}

Future<void> _init() async {
  print("Init: Starting...");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light, // For Android (light icons)
    statusBarBrightness: Brightness.dark, // For iOS (light icons)
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarContrastEnforced: false,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  print("Init: Setting deployment...");
  await _setDeployment(Deployment.production);
  print("Init: Initializing Dependency Injection...");
  await di.init();
  print("Init: Finished.");
}
