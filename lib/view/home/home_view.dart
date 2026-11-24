import 'package:flutter/material.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/data/portfolio_data.dart';
import 'package:haroon_portfolio/provider/site_provider.dart';
import 'package:haroon_portfolio/provider/theme_provider.dart';
import 'package:haroon_portfolio/view/home/components/about_section.dart';
import 'package:haroon_portfolio/view/home/components/contact_section.dart';
import 'package:haroon_portfolio/view/home/components/doors_section.dart';
import 'package:haroon_portfolio/view/home/components/footer_section.dart';
import 'package:haroon_portfolio/view/home/components/hero_section.dart';
import 'package:haroon_portfolio/view/home/components/projects_section.dart';
import 'package:haroon_portfolio/view/home/components/story_section.dart';
import 'package:haroon_portfolio/widgets/app_nav_bar.dart';
import 'package:haroon_portfolio/widgets/marquee_strip.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = <String, GlobalKey>{
    'home': GlobalKey(),
    'doors': GlobalKey(),
    'projects': GlobalKey(),
    'about': GlobalKey(),
    'story': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  double _sectionTop(String key) {
    final BuildContext? context = _sectionKeys[key]?.currentContext;
    if (context == null) {
      return double.infinity;
    }
    final RenderBox box = context.findRenderObject() as RenderBox;
    final double scrollY = _scrollController.offset;
    final double viewportTop = box.localToGlobal(Offset.zero).dy;
    return scrollY + viewportTop;
  }

  void _onScroll() {
    final SiteProvider site = context.read<SiteProvider>();
    final double probe =
        _scrollController.offset + MediaQuery.of(context).size.height * 0.35;
    final double maxScroll = _scrollController.position.maxScrollExtent;
    String active = 'home';
    if (_scrollController.offset >= maxScroll - 40) {
      active = 'contact';
    } else if (probe >= _sectionTop('contact')) {
      active = 'contact';
    } else if (probe >= _sectionTop('story')) {
      active = 'story';
    } else if (probe >= _sectionTop('about')) {
      active = 'home';
    } else if (probe >= _sectionTop('projects')) {
      active = 'apps';
    } else if (probe >= _sectionTop('doors')) {
      final String openDoor = site.openDoor;
      active = PortfolioData.services.any((s) => s.key == openDoor)
          ? openDoor
          : 'apps';
    } else {
      active = 'home';
    }
    site.setActiveNav(active);
  }

  void _navigateTo(String key) {
    final SiteProvider site = context.read<SiteProvider>();
    if (PortfolioData.services.any((s) => s.key == key)) {
      site.openDoorOnly(key);
    }
    final String section = _sectionForNav(key);
    final BuildContext? targetContext =
        _sectionKeys[section]?.currentContext;
    if (targetContext == null) {
      return;
    }
    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
      alignment: 0.02,
    );
  }

  String _sectionForNav(String key) {
    switch (key) {
      case 'home':
        return 'home';
      case 'apps':
      case 'backend':
      case 'ui':
      case 'bugs':
        return 'doors';
      case 'story':
        return 'story';
      case 'contact':
        return 'contact';
      default:
        return 'home';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider theme = context.watch<ThemeProvider>();
    final bool isDark = theme.isDark;
    final Color background =
        isDark ? AppColors.paperDark : AppColors.paper;
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                const MarqueeStrip(),
                Container(
                  key: _sectionKeys['home'],
                  color: background,
                  child: HeroSection(
                    isDark: isDark,
                    onSeeWork: () => _navigateTo('apps'),
                  ),
                ),
                Container(
                  key: _sectionKeys['doors'],
                  child: DoorsSection(
                    onSeeWork: () => _navigateTo('apps'),
                  ),
                ),
                Container(
                  key: _sectionKeys['projects'],
                  child: ProjectsSection(
                    onBackToDoors: () => _navigateTo('apps'),
                  ),
                ),
                Container(
                  key: _sectionKeys['about'],
                  child: const AboutSection(),
                ),
                Container(
                  key: _sectionKeys['story'],
                  child: const StorySection(),
                ),
                Container(
                  key: _sectionKeys['contact'],
                  child: ContactSection(
                    isDark: isDark,
                    onSeeWork: () => _navigateTo('apps'),
                  ),
                ),
                const FooterSection(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1220),
                child: AppNavBar(
                  isDark: isDark,
                  onNavigate: _navigateTo,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
