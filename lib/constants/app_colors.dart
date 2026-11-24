import 'package:flutter/material.dart';

class AppColors {
  static const Color paper = Color(0xFFF2EEE3);
  static const Color paperDark = Color(0xFF111E22);
  static const Color paperDark2 = Color(0xFF121E22);
  static const Color ink = Color(0xFF141310);
  static const Color inkSoft = Color(0xFF55524A);
  static const Color inkLight = Color(0xFFF4F1E6);
  static const Color inkSoftDark = Color(0xFFA7B3B0);
  static const Color blue = Color(0xFF2E7CC8);
  static const Color blueLight = Color(0xFF3A8AD4);
  static const Color blueDark = Color(0xFF1C5A96);
  static const Color mint = Color(0xFFA8D5A2);
  static const Color mintLight = Color(0xFFC2E3BA);
  static const Color mintDark = Color(0xFF7FB573);
  static const Color orange = Color(0xFFE07A2E);
  static const Color orangeLight = Color(0xFFEF9550);
  static const Color orangeDark = Color(0xFFB45A17);
  static const Color slate = Color(0xFF232D33);
  static const Color gold = Color(0xFFC9A24B);
  static const Color brassLight = Color(0xFFE9CD7E);
  static const Color brassDark = Color(0xFF96762A);
  static const Color creamTag = Color(0xFFFAF6EA);
  static const Color whatsapp = Color(0xFF25D366);
  static const Color doorBlack = Color(0xFF0F0F0F);
  static const Color footer = Color(0xFF0B1417);
  static const Color tomatoGreen = Color(0xFF3D9E4D);
  static const Color tomatoBg = Color(0xFF0C3524);

  static Color surface(bool isDark) {
    return isDark ? const Color(0xFF18282C) : Colors.white;
  }

  static Color cardBorder(bool isDark) {
    return isDark
        ? Colors.white.withValues(alpha: 0.10)
        : Colors.black.withValues(alpha: 0.08);
  }
}
