import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/provider/site_provider.dart';
import 'package:haroon_portfolio/provider/theme_provider.dart';
import 'package:haroon_portfolio/service/firebase_setup.dart';
import 'package:haroon_portfolio/view/home/home_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseSetup.initialize();
  runApp(const HaroonPortfolioApp());
}

class HaroonPortfolioApp extends StatelessWidget {
  const HaroonPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ChangeNotifierProvider<ChangeNotifier>>[
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<SiteProvider>(
          create: (_) => SiteProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, ThemeProvider theme, Widget? child) {
          final bool isDark = theme.isDark;
          return MaterialApp(
            title: 'Muhammad Haroon — Flutter Developer',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: isDark ? Brightness.dark : Brightness.light,
              scaffoldBackgroundColor:
                  isDark ? AppColors.paperDark : AppColors.paper,
              textTheme: GoogleFonts.poppinsTextTheme(
                ThemeData(
                  brightness: isDark ? Brightness.dark : Brightness.light,
                ).textTheme,
              ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.orange,
                brightness: isDark ? Brightness.dark : Brightness.light,
              ),
              useMaterial3: true,
            ),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
