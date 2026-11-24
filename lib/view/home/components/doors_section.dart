import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/constants/app_strings.dart';
import 'package:haroon_portfolio/data/portfolio_data.dart';
import 'package:haroon_portfolio/provider/site_provider.dart';
import 'package:haroon_portfolio/widgets/door_panel.dart';
import 'package:haroon_portfolio/widgets/door_widget.dart';
import 'package:haroon_portfolio/widgets/reveal.dart';
import 'package:haroon_portfolio/widgets/section_heading.dart';
import 'package:provider/provider.dart';

class DoorsSection extends StatelessWidget {
  const DoorsSection({super.key, required this.onSeeWork});

  final VoidCallback onSeeWork;

  @override
  Widget build(BuildContext context) {
    final SiteProvider site = context.watch<SiteProvider>();
    final double width = MediaQuery.of(context).size.width;
    final int columns = width > 1020 ? 4 : (width > 560 ? 2 : 2);
    final double doorWidth =
        (width > 1220 ? 1220 : width * 0.93) / columns - 16;
    final int openIndex = PortfolioData.services.indexWhere(
      (s) => s.key == site.openDoor,
    );
    final bool hasOpen = openIndex >= 0;
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
              const Reveal(
                child: SectionHeading(
                  kicker: AppStrings.doorsKicker,
                  title: AppStrings.doorsTitle,
                  subtitle: AppStrings.doorsSub,
                ),
              ),
              const SizedBox(height: 12),
              Reveal(
                child: Text(
                  '↓ ${AppStrings.doorsHint.toUpperCase()} ↓',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.5,
                    color: AppColors.gold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 16,
                runSpacing: 40,
                children: List<Widget>.generate(
                  PortfolioData.services.length,
                  (int i) {
                    return SizedBox(
                      width: doorWidth,
                      child: DoorWidget(
                        service: PortfolioData.services[i],
                        index: i,
                      ),
                    );
                  },
                ),
              ),
              if (hasOpen) ...<Widget>[
                const SizedBox(height: 56),
                DoorPanel(
                  service: PortfolioData.services[openIndex],
                  onSeeWork: onSeeWork,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
