import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/data/portfolio_data.dart';
import 'package:haroon_portfolio/provider/site_provider.dart';
import 'package:haroon_portfolio/utils/live_date.dart';
import 'package:provider/provider.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key, required this.onNavigate, required this.isDark});

  final void Function(String key) onNavigate;
  final bool isDark;

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  final Map<String, GlobalKey> _linkKeys = <String, GlobalKey>{
    for (final String key in PortfolioData.navItems) key: GlobalKey(),
  };
  final GlobalKey _rowKey = GlobalKey();
  Rect? _pillRect;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _placePill());
  }

  void _placePill() {
    final SiteProvider site = context.read<SiteProvider>();
    final GlobalKey? linkKey = _linkKeys[site.activeNav];
    final RenderBox? rowBox =
        _rowKey.currentContext?.findRenderObject() as RenderBox?;
    final RenderBox? linkBox =
        linkKey?.currentContext?.findRenderObject() as RenderBox?;
    if (rowBox == null || linkBox == null) {
      return;
    }
    final Offset linkOffset = linkBox.localToGlobal(Offset.zero);
    final Offset rowOffset = rowBox.localToGlobal(Offset.zero);
    final Offset relative = linkOffset - rowOffset;
    final Rect rect = Rect.fromLTWH(
      relative.dx,
      relative.dy,
      linkBox.size.width,
      linkBox.size.height,
    );
    if (_pillRect != rect) {
      setState(() {
        _pillRect = rect;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final SiteProvider site = context.watch<SiteProvider>();
    final bool isDark = widget.isDark;
    final bool isMobile = MediaQuery.of(context).size.width <= 700;
    WidgetsBinding.instance.addPostFrameCallback((_) => _placePill());
    final Color pillBg = isDark
        ? Colors.white.withValues(alpha: 0.10)
        : Colors.black.withValues(alpha: 0.06);
    return Container(
      margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF0D181C).withValues(alpha: 0.72)
            : Colors.white.withValues(alpha: 0.62),
        borderRadius: BorderRadius.circular(isMobile ? 20 : 999),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.10)
              : Colors.black.withValues(alpha: 0.08),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isMobile ? 14 : 999),
        child: BackdropFilter(
          filter: const ColorFilter.mode(
            Colors.transparent,
            BlendMode.srcOver,
          ),
          child: Stack(
            key: _rowKey,
            children: <Widget>[
              AnimatedPositioned(
                left: _pillRect?.left ?? 0,
                top: _pillRect?.top ?? 0,
                width: _pillRect?.width ?? 0,
                height: _pillRect?.height ?? 0,
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeInOut,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: <Color>[AppColors.orange, AppColors.gold],
                    ),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 2,
                runSpacing: 6,
                children: <Widget>[
                  Container(
                    width: 42,
                    height: 42,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          AppColors.paperDark,
                          AppColors.blue,
                          AppColors.orange,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'MH',
                        style: GoogleFonts.archivo(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  for (final String key in PortfolioData.navItems)
                    _NavLink(
                      key: _linkKeys[key],
                      label: isMobile
                          ? PortfolioData.navShortLabels[key]!
                          : PortfolioData.navLabels[key]!,
                      isActive: site.activeNav == key,
                      isDark: isDark,
                      onTap: () => widget.onNavigate(key),
                    ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: pillBg,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      LiveDate.today(),
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: isDark ? AppColors.inkLight : AppColors.ink,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({
    super.key,
    required this.label,
    required this.isActive,
    required this.isDark,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isActive
                ? Colors.white
                : (isDark ? AppColors.inkSoftDark : AppColors.inkSoft),
          ),
        ),
      ),
    );
  }
}
