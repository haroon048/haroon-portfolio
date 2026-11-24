import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';

class NameWave extends StatefulWidget {
  const NameWave({super.key, required this.text, required this.isDark});

  final String text;
  final bool isDark;

  @override
  State<NameWave> createState() => _NameWaveState();
}

class _NameWaveState extends State<NameWave> with TickerProviderStateMixin {
  late final AnimationController _waveController;
  late final AnimationController _shineController;
  late final AnimationController _enterController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat();
    _shineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3400),
    )..repeat();
    _enterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
  }

  @override
  void dispose() {
    _waveController.dispose();
    _shineController.dispose();
    _enterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double fontSize = width < 600 ? 44 : 72;
    final List<String> letters = widget.text.split('');
    return AnimatedBuilder(
      animation: Listenable.merge(
        <Listenable>[_waveController, _shineController, _enterController],
      ),
      builder: (BuildContext context, Widget? child) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            final double shift = _shineController.value * 2.8 - 0.9;
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: <double>[
                (shift - 0.25).clamp(0.0, 1.0),
                shift.clamp(0.0, 1.0),
                (shift + 0.25).clamp(0.0, 1.0),
              ],
              colors: <Color>[
                widget.isDark ? AppColors.inkLight : AppColors.ink,
                AppColors.orange,
                widget.isDark ? AppColors.inkLight : AppColors.ink,
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: Wrap(
            children: List<Widget>.generate(letters.length, (int i) {
              final double enterDelay = i * 0.045;
              final double enterProgress =
                  ((_enterController.value - enterDelay) / (1 - enterDelay))
                      .clamp(0.0, 1.0);
              final double wave = math.sin(
                _waveController.value * 2 * math.pi + i * 0.45,
              );
              final double dy = wave * 6 * enterProgress;
              return Transform.translate(
                offset: Offset(0, dy - (1 - enterProgress) * 18),
                child: Opacity(
                  opacity: enterProgress,
                  child: Text(
                    letters[i] == ' ' ? '\u00A0' : letters[i],
                    style: GoogleFonts.archivo(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w900,
                      height: 1.02,
                      color: widget.isDark
                          ? AppColors.inkLight
                          : AppColors.ink,
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
