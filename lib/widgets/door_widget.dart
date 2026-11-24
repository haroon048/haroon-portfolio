import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/model/service_model.dart';
import 'package:haroon_portfolio/provider/site_provider.dart';
import 'package:provider/provider.dart';

class DoorWidget extends StatefulWidget {
  const DoorWidget({super.key, required this.service, required this.index});

  final ServiceModel service;
  final int index;

  @override
  State<DoorWidget> createState() => _DoorWidgetState();
}

class _DoorWidgetState extends State<DoorWidget> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final SiteProvider site = context.watch<SiteProvider>();
    final bool isOpen = site.openDoor == widget.service.key;
    final double leafAngle = isOpen ? -1.8 : (_hovering ? -0.24 : 0);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () => site.setOpenDoor(widget.service.key),
        child: SizedBox(
          height: 480,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.ink,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(220),
                      topRight: Radius.circular(220),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    border: Border.all(
                      color: AppColors.gold.withValues(alpha: 0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.gold,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              widget.service.iconLetter,
                              style: GoogleFonts.archivo(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: AppColors.gold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.service.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppColors.gold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Full showcase below',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 650),
                curve: Curves.easeInOut,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(leafAngle),
                transformAlignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: widget.service.doorGradient,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(220),
                      topRight: Radius.circular(220),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.35),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List<Widget>.generate(3, (_) {
                            return Container(
                              width: 2,
                              height: double.infinity,
                              color: Colors.black.withValues(alpha: 0.08),
                            );
                          }),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: <Color>[
                                  AppColors.brassLight,
                                  AppColors.gold,
                                  AppColors.brassDark,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '0${widget.index + 1}',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: AppColors.ink,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 22,
                        top: 300,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 34,
                              height: 8,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: <Color>[
                                    AppColors.brassLight,
                                    AppColors.brassDark,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.brassLight,
                                  width: 2,
                                ),
                                color: AppColors.ink,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 26,
                        child: Text(
                          widget.service.doorLabel,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: widget.service.doorTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isOpen)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -26,
                  child: Container(
                    height: 22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      gradient: RadialGradient(
                        colors: <Color>[
                          AppColors.gold.withValues(alpha: 0.55),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
