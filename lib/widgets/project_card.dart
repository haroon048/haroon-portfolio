import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/constants/app_strings.dart';
import 'package:haroon_portfolio/model/project_model.dart';
import 'package:haroon_portfolio/widgets/reveal.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
    required this.flip,
    required this.onBackToDoors,
  });

  final ProjectModel project;
  final bool flip;
  final VoidCallback onBackToDoors;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 900;
    final Widget phone = MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedSlide(
        offset: Offset(0, _hovering ? -0.02 : 0),
        duration: const Duration(milliseconds: 300),
        child: AnimatedRotation(
          turns: _hovering ? -0.003 : 0,
          duration: const Duration(milliseconds: 300),
          child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 30,
              left: -18,
              right: -18,
              bottom: 10,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      colors: <Color>[
                        widget.project.initialColor.withValues(alpha: 0.75),
                        AppColors.orange.withValues(alpha: 0.55),
                        AppColors.blue.withValues(alpha: 0.55),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 250,
              height: 460,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.ink,
                borderRadius: BorderRadius.circular(38),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.18),
                  width: 2,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.45),
                    blurRadius: 28,
                    offset: const Offset(0, 14),
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Container(
                      color: widget.project.title == 'TomatoDoc AI'
                          ? AppColors.tomatoBg
                          : Colors.white,
                      child: Image.asset(
                        widget.project.imageAsset,
                        width: double.infinity,
                        height: double.infinity,
                        fit: widget.project.imageFit,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 76,
                        height: 18,
                        decoration: BoxDecoration(
                          color: AppColors.ink,
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
    final Widget text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: widget.project.initialColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  widget.project.initial,
                  style: GoogleFonts.archivo(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                widget.project.category,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: AppColors.orange,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          widget.project.title,
          style: GoogleFonts.archivo(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            color: AppColors.inkLight,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          widget.project.description,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 1.65,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: widget.project.tags.map((String tag) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.25),
                ),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                tag,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 22),
        TextButton(
          onPressed: widget.onBackToDoors,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: AppColors.gold,
          ),
          child: Text(
            '↑ ${AppStrings.backToDoors}',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
    return Reveal(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 40),
        decoration: BoxDecoration(
          color: AppColors.slate,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 30,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: isWide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (!widget.flip) ...<Widget>[
                    phone,
                    const SizedBox(width: 48),
                    Expanded(child: text),
                  ] else ...<Widget>[
                    Expanded(child: text),
                    const SizedBox(width: 48),
                    phone,
                  ],
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  phone,
                  const SizedBox(height: 32),
                  text,
                ],
              ),
      ),
    );
  }
}
