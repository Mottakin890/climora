import 'package:flutter/material.dart';

abstract final class AppColors {
  // Core palette
  static const Color primaryBlue = Color(0xFF4A90E2);
  static const Color accentCyan = Color(0xFF00D4FF);
  static const Color deepNavy = Color(0xFF0A0E21);
  static const Color midnightBlue = Color(0xFF0D1B3E);
  static const Color glassWhite = Color(0x1AFFFFFF);
  static const Color glassWhiteStrong = Color(0x33FFFFFF);
  static const Color glassBorder = Color(0x26FFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xCCFFFFFF);
  static const Color subtleWhite = Color(0x80FFFFFF);
  static const Color error = Color(0xFFFF6B6B);
  static const Color sunnyYellow = Color(0xFFFFD700);
  static const Color rainBlue = Color(0xFF74B9FF);
  static const Color transparent = Colors.transparent;

  // Gradients
  static const LinearGradient skyGradientDay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1A3A6B), Color(0xFF244E8A), Color(0xFF2D6AB0)],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient skyGradientNight = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF060B1A), Color(0xFF0D1B3E), Color(0xFF162447)],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient skyGradientRainy = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1C2E4A), Color(0xFF26405E), Color(0xFF2E4F70)],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient glassCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x33FFFFFF), Color(0x0DFFFFFF)],
  );

  static const LinearGradient shimmerGradient = LinearGradient(
    colors: [Color(0x1AFFFFFF), Color(0x33FFFFFF), Color(0x1AFFFFFF)],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  // Card-specific
  static const LinearGradient hotGradient = LinearGradient(
    colors: [Color(0xFFFF6B35), Color(0xFFFF8E53)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient coldGradient = LinearGradient(
    colors: [Color(0xFF4A90E2), Color(0xFF00D4FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
