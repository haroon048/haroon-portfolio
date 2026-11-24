import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/provider/site_provider.dart';
import 'package:provider/provider.dart';

class HeroPhoto extends StatelessWidget {
  const HeroPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    final SiteProvider site = context.watch<SiteProvider>();
    final double tiltX = site.tiltX;
    final double tiltY = site.tiltY;
    return MouseRegion(
      onHover: (PointerEvent event) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final Offset local = box.globalToLocal(event.position);
        final Size size = box.size;
        final double dx = (local.dx / size.width - 0.5) * 2;
        final double dy = (local.dy / size.height - 0.5) * 2;
        site.setTilt(dy, dx);
      },
      onExit: (_) => site.resetTilt(),
      child: SizedBox(
        width: 380,
        height: 470,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: -30,
              left: -30,
              right: -30,
              bottom: -10,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(240),
                    gradient: const SweepGradient(
                      colors: <Color>[
                        AppColors.orange,
                        AppColors.gold,
                        AppColors.blue,
                        Color(0xFF2A9D8F),
                        AppColors.orange,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 6,
              left: 14,
              right: -6,
              bottom: -6,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.paperDark,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(220),
                    topRight: Radius.circular(220),
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
              ),
            ),
            Transform.scale(
              scale: 1.0 + (tiltX.abs() + tiltY.abs()) * 0.02,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(tiltY * 0.18)
                  ..rotateX(-tiltX * 0.14),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(220),
                    topRight: Radius.circular(220),
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                  child: SizedBox(
                    width: 380,
                    height: 470,
                    child: OverflowBox(
                      maxWidth: 551,
                      maxHeight: 682,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/haroon.png',
                        width: 551,
                        height: 682,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 18,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.ink,
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
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
                      'Muhammad Haroon · Flutter Developer · Sadiqabad, Pakistan',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
