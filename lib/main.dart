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
  developer.log("SetDeployment: Loading .env...", name: 'Main');
  await dotenv.load(fileName: ".env");
  developer.log("SetDeployment: .env loaded.", name: 'Main');
  try {
    ApiEndpoints.baseUrl = (deployment == Deployment.production)
        ? dotenv.env['PRODUCTION_BASE_URL']!
        : dotenv.env['STAGING_BASE_URL']!;

    ApiEndpoints.apiKey = (deployment == Deployment.production)
        ? dotenv.env['PRODUCTION_API_KEY']!
        : dotenv.env['STAGING_API_KEY']!;
    developer.log("SetDeployment: ApiEndpoints configured for Production.", name: 'Main');
  } catch (e) {
    developer.log("SetDeployment Error while accessing .env: $e", name: 'Main', error: e);
  }
}

Future<void> _init() async {
  developer.log("Init: Starting...", name: 'Main');
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
  developer.log("Init: Setting deployment...", name: 'Main');
  await _setDeployment(Deployment.production);
  developer.log("Init: Initializing Dependency Injection...", name: 'Main');
  await di.init();
  developer.log("Init: Finished.", name: 'Main');
}
