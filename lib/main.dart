import 'package:climora/app.dart';
import 'package:climora/data/configs/api_endpoints.dart';
import 'package:climora/common/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as developer;

void main(List<String> args) async {
  await _init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    return runApp(const Climora());
  });
}

Future<void> _setDeployment(Deployment deployment) async {
  await dotenv.load(fileName: ".env");
  try {
    ApiEndpoints.baseUrl = (deployment == Deployment.production)
        ? dotenv.env['PRODUCTION_BASE_URL']!
        : dotenv.env['STAGING_BASE_URL']!;
  } catch (e) {
    developer.log(e.toString());
  }
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await _setDeployment(Deployment.production);
}
