import 'package:flutter/material.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/constants/app_strings.dart';
import 'package:haroon_portfolio/data/portfolio_data.dart';
import 'package:haroon_portfolio/widgets/project_card.dart';
import 'package:haroon_portfolio/widgets/reveal.dart';
import 'package:haroon_portfolio/widgets/section_heading.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.onBackToDoors});

  final VoidCallback onBackToDoors;

  @override
  Widget build(BuildContext context) {
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
                  kicker: AppStrings.projectsKicker,
                  title: AppStrings.projectsTitle,
                  subtitle: AppStrings.projectsSub,
                ),
              ),
              const SizedBox(height: 48),
              Column(
                children: List<Widget>.generate(
                  PortfolioData.projects.length,
                  (int i) {
                    return Container(
                      margin: EdgeInsets.only(top: i == 0 ? 0 : 28),
                      child: ProjectCard(
                        project: PortfolioData.projects[i],
                        flip: i.isOdd,
                        onBackToDoors: onBackToDoors,
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
