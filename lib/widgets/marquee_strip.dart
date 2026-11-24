import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/constants/app_strings.dart';

class MarqueeStrip extends StatefulWidget {
  const MarqueeStrip({super.key});

  @override
  State<MarqueeStrip> createState() => _MarqueeStripState();
}

class _MarqueeStripState extends State<MarqueeStrip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String text = AppStrings.marquee * 4;
    final TextStyle style = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      letterSpacing: 3.6,
      color: Colors.white,
    );
    return Container(
      width: double.infinity,
      height: 37,
      color: AppColors.ink,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRect(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.translate(
              offset: Offset(-_controller.value * 1200, 0),
              child: child,
            );
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(text, style: style),
                Text(text, style: style),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
