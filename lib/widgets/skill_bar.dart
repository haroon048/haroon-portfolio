import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/model/skill_model.dart';
import 'package:haroon_portfolio/widgets/reveal.dart';

class SkillBar extends StatelessWidget {
  const SkillBar({super.key, required this.skill, required this.delay});

  final SkillModel skill;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return Reveal(
      delay: delay,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    skill.name,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.inkLight,
                    ),
                  ),
                ),
                Text(
                  skill.level,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mint,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              skill.detail,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.inkSoftDark,
              ),
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: Container(
                height: 8,
                color: Colors.white.withValues(alpha: 0.10),
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: skill.levelValue),
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.easeOut,
                  builder: (BuildContext context, double value, Widget? child) {
                    return FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: value,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[AppColors.blue, AppColors.mint],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
