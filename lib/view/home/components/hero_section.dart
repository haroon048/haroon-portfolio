import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/constants/app_strings.dart';
import 'package:haroon_portfolio/widgets/cv_buttons.dart';
import 'package:haroon_portfolio/widgets/hero_photo.dart';
import 'package:haroon_portfolio/widgets/name_wave.dart';
import 'package:haroon_portfolio/widgets/role_tag.dart';
import 'package:haroon_portfolio/widgets/theme_toggle.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.isDark,
    required this.onSeeWork,
  });

  final bool isDark;
  final VoidCallback onSeeWork;

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 900;
    final Color textColor = isDark ? AppColors.inkLight : AppColors.ink;
    final Color subColor = isDark ? AppColors.inkSoftDark : AppColors.inkSoft;
    final Widget left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(width: 38, height: 3, color: AppColors.orange),
            const SizedBox(width: 12),
            Text(
              AppStrings.eyebrow.toUpperCase(),
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                letterSpacing: 3,
                color: subColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          AppStrings.heroGreeting,
          style: GoogleFonts.archivo(
            fontSize: isWide ? 72 : 44,
            fontWeight: FontWeight.w900,
            height: 1.02,
            color: textColor,
          ),
        ),
        NameWave(text: AppStrings.name, isDark: isDark),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'I am a',
              style: GoogleFonts.archivo(
                fontSize: isWide ? 40 : 28,
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
            ),
            const SizedBox(width: 18),
            const RoleTag(),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          AppStrings.roleSmall,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.5,
            color: subColor,
          ),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            AppStrings.heroLead,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.65,
              color: subColor,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: <Widget>[
            const ThemeToggle(),
            ElevatedButton(
              onPressed: onSeeWork,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.ink,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                elevation: 0,
              ),
              child: Text(
                '${AppStrings.seeMyWork} ↓',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CvButtons(isDark: isDark),
      ],
    );
    final Widget strip = Padding(
      padding: const EdgeInsets.only(top: 56),
      child: Wrap(
        spacing: 28,
        runSpacing: 10,
        alignment: WrapAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: Color(0xFF2ECC71),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                AppStrings.available.toUpperCase(),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                  color: subColor,
                ),
              ),
            ],
          ),
          Text(
            '${AppStrings.scrollExplore.toUpperCase()} ↓',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
              color: subColor,
            ),
          ),
          Text(
            '2026 © ${AppStrings.name}',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              color: subColor,
            ),
          ),
        ],
      ),
    );
    if (!isWide) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            left,
            const SizedBox(height: 48),
            const Center(child: HeroPhoto()),
            strip,
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 64),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(flex: 155, child: left),
              const SizedBox(width: 40),
              const Expanded(flex: 95, child: HeroPhoto()),
            ],
          ),
          strip,
        ],
      ),
    );
  }
}
