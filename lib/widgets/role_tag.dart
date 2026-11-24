import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/data/portfolio_data.dart';

class RoleTag extends StatefulWidget {
  const RoleTag({super.key});

  @override
  State<RoleTag> createState() => _RoleTagState();
}

class _RoleTagState extends State<RoleTag>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  late final AnimationController _cycleController;

  @override
  void initState() {
    super.initState();
    _cycleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    );
    _cycleController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        if (mounted) {
          setState(() {
            _index = (_index + 1) % PortfolioData.roles.length;
          });
        }
        _cycleController.forward(from: 0);
      }
    });
    _cycleController.forward();
  }

  @override
  void dispose() {
    _cycleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.044,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: -9,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(8, (_) {
                return Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.gold,
                      width: 2,
                    ),
                    color: AppColors.creamTag,
                  ),
                );
              }),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.creamTag,
              borderRadius: BorderRadius.circular(6),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.18),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 550),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.25, end: 0).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: Text(
                PortfolioData.roles[_index],
                key: ValueKey<String>(PortfolioData.roles[_index]),
                style: GoogleFonts.archivo(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ink,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
