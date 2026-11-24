import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/constants/app_strings.dart';
import 'package:haroon_portfolio/data/portfolio_data.dart';
import 'package:haroon_portfolio/widgets/reveal.dart';
import 'package:haroon_portfolio/widgets/section_heading.dart';
import 'package:haroon_portfolio/widgets/skill_bar.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 900;
    final List<String> tags = <String>[
      'Sadiqabad, Pakistan',
      "KFUEIT — BS CS '27",
      'Intern @ Dot Sinc RYK',
      'Remote Friendly',
    ];
    final Widget aboutCard = Reveal(
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SectionHeading(
              kicker: 'About',
              title: AppStrings.aboutTitle,
            ),
            const SizedBox(height: 18),
            Text(
              AppStrings.aboutBody1,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.65,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              AppStrings.aboutBody2,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.65,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 22),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: tags.map((String tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.07),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.inkLight,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
    final Widget skillsCard = Reveal(
      delay: const Duration(milliseconds: 120),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Skills',
              style: GoogleFonts.archivo(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: AppColors.inkLight,
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).size.width > 560 ? 2 : 1,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 2.1,
              ),
              itemCount: PortfolioData.skills.length,
              itemBuilder: (BuildContext context, int i) {
                return SkillBar(
                  skill: PortfolioData.skills[i],
                  delay: Duration(milliseconds: i * 80),
                );
              },
            ),
          ],
        ),
      ),
    );
    return Container(
      width: double.infinity,
      color: AppColors.paperDark,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 84),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1220),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: aboutCard),
                    const SizedBox(width: 24),
                    Expanded(child: skillsCard),
                  ],
                )
              : Column(
                  children: <Widget>[
                    aboutCard,
                    const SizedBox(height: 24),
                    skillsCard,
                  ],
                ),
        ),
      ),
    );
  }
}
