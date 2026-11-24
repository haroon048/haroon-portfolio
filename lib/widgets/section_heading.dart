import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.kicker,
    required this.title,
    this.subtitle,
    this.isDark = true,
    this.center = false,
  });

  final String kicker;
  final String title;
  final String? subtitle;
  final bool isDark;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final Color textColor = isDark ? AppColors.inkLight : AppColors.ink;
    final Color subColor = isDark ? AppColors.inkSoftDark : AppColors.inkSoft;
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          kicker.toUpperCase(),
          textAlign: center ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            letterSpacing: 3,
            color: AppColors.orange,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: center ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.archivo(
            fontSize: 44,
            fontWeight: FontWeight.w800,
            height: 1.05,
            color: textColor,
          ),
        ),
        if (subtitle != null) ...<Widget>[
          const SizedBox(height: 14),
          Text(
            subtitle!,
            textAlign: center ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.6,
              color: subColor,
            ),
          ),
        ],
      ],
    );
  }
}
