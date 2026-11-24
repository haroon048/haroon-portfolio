import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/constants/app_strings.dart';
import 'package:haroon_portfolio/data/portfolio_data.dart';
import 'package:haroon_portfolio/widgets/reveal.dart';

class StorySection extends StatelessWidget {
  const StorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 900;
    return Container(
      width: double.infinity,
      color: AppColors.paperDark,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 84),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Reveal(
                child: Text(
                  AppStrings.storyKicker,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.inkSoftDark,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Reveal(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: <Color>[
                        Colors.white,
                        AppColors.gold,
                        AppColors.orange,
                        AppColors.blue,
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    '2026',
                    style: GoogleFonts.archivo(
                      fontSize: isWide ? 200 : 120,
                      fontWeight: FontWeight.w800,
                      height: 0.95,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 3,
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 1600),
                        curve: Curves.easeOut,
                        builder: (BuildContext context, double value,
                            Widget? child) {
                          return FractionallySizedBox(
                            widthFactor: value,
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 3,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    AppColors.orange,
                                    AppColors.gold,
                                    AppColors.blue,
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: PortfolioData.timeline.map((item) {
                      return Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.gold,
                                border: Border.all(
                                  color: AppColors.paperDark,
                                  width: 2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item.date,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: AppColors.inkLight,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.label,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColors.inkSoftDark,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              Column(
                children: List<Widget>.generate(
                  PortfolioData.timeline.length,
                  (int i) {
                    final item = PortfolioData.timeline[i];
                    return Reveal(
                      delay: Duration(milliseconds: i * 100),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 18),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.10),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.gold,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                item.icon,
                                color: AppColors.gold,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${item.date} · ${item.label}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.5,
                                      color: AppColors.orange,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    item.title,
                                    style: GoogleFonts.archivo(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.inkLight,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    item.body,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.6,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
