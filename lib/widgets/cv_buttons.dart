import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/service/contact_service.dart';
import 'package:haroon_portfolio/service/cv_service.dart';

class CvButtons extends StatelessWidget {
  const CvButtons({super.key, this.isDark = false});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: <Widget>[
        ElevatedButton(
          onPressed: ContactService.viewCv,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.ink,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
            elevation: 0,
          ),
          child: Text(
            'View CV',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        OutlinedButton(
          onPressed: CvService.downloadCv,
          style: OutlinedButton.styleFrom(
            foregroundColor: isDark ? AppColors.inkLight : AppColors.ink,
            side: BorderSide(
              color: isDark ? AppColors.inkLight : AppColors.ink,
              width: 1.5,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          child: Text(
            'Download CV',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
