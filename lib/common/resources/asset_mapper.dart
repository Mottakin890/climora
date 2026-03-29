import 'package:climora/common/resources/app_assets.dart';

extension WeatherAssetExtension on String {
  String get iconAsset {
    final condition = toLowerCase();
    if (condition.contains('sunny')) return AppAssets.sunny;
    if (condition.contains('clear')) return AppAssets.clear;
    if (condition.contains('partly cloudy')) return AppAssets.partlycloudy;
    if (condition.contains('cloudy')) return AppAssets.cloudy;
    if (condition.contains('overcast')) return AppAssets.overcast;
    if (condition.contains('mist') || condition.contains('fog')) return AppAssets.mist;
    if (condition.contains('thunder')) return AppAssets.patchylightrainwiththunder;
    if (condition.contains('heavy rain')) return AppAssets.heavyrain;
    if (condition.contains('moderate rain')) return AppAssets.moderaterain;
    if (condition.contains('patchy rain')) return AppAssets.patchyrainpossible;
    if (condition.contains('light rain')) return AppAssets.lightrain;
    if (condition.contains('drizzle')) return AppAssets.lightdrizzle;
    if (condition.contains('snow')) return AppAssets.cloudy; // Update when snow assets are available
    
    return AppAssets.sunny; // default
  }
}
