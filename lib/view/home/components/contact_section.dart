import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/constants/app_strings.dart';
import 'package:haroon_portfolio/service/contact_service.dart';
import 'package:haroon_portfolio/widgets/contact_form.dart';
import 'package:haroon_portfolio/widgets/cv_buttons.dart';
import 'package:haroon_portfolio/widgets/reveal.dart';
import 'package:haroon_portfolio/widgets/theme_toggle.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.isDark, required this.onSeeWork});

  final bool isDark;
  final VoidCallback onSeeWork;

  @override
  Widget build(BuildContext context) {
    final Color textColor = isDark ? AppColors.inkLight : AppColors.ink;
    final Color subColor = isDark ? AppColors.inkSoftDark : AppColors.inkSoft;
    final List<Map<String, String>> links = <Map<String, String>>[
      <String, String>{
        'label': 'Email',
        'value': AppStrings.email,
        'url': 'mailto:${AppStrings.email}',
      },
      <String, String>{
        'label': 'GitHub',
        'value': 'github.com/haroon048',
        'url': AppStrings.githubUrl,
      },
      <String, String>{
        'label': 'LinkedIn',
        'value': 'Muhammad Haroon',
        'url': AppStrings.linkedinUrl,
      },
      <String, String>{
        'label': 'Contra',
        'value': 'Hire me on Contra',
        'url': AppStrings.contraUrl,
      },
    ];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? const <Color>[
                  AppColors.paperDark,
                  Color(0xFF1A2B2E),
                  Color(0xFF16283D),
                ]
              : const <Color>[
                  AppColors.paper,
                  Color(0xFFF7EAD2),
                  Color(0xFFDBEEFF),
                ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 84),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Reveal(
                child: Text(
                  AppStrings.contactEyebrow.toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 3,
                    color: AppColors.orange,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Reveal(
                child: Text(
                  AppStrings.contactTitle1,
                  style: GoogleFonts.archivo(
                    fontSize: 56,
                    fontWeight: FontWeight.w800,
                    height: 1.02,
                    color: textColor,
                  ),
                ),
              ),
              Reveal(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: <Color>[
                        AppColors.orange,
                        AppColors.gold,
                        AppColors.blue,
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    AppStrings.contactTitle2,
                    style: GoogleFonts.archivo(
                      fontSize: 56,
                      fontWeight: FontWeight.w800,
                      height: 1.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Reveal(
                child: Text(
                  AppStrings.contactSub,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                    color: subColor,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Reveal(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: <Widget>[
                    const ThemeToggle(),
                    ElevatedButton.icon(
                      onPressed: () => ContactService.openWhatsApp(),
                      icon: const Icon(Icons.chat, size: 20),
                      label: Text(
                        'Chat on WhatsApp',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.whatsapp,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        elevation: 0,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => ContactService.openEmail(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Send Email',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: onSeeWork,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: textColor,
                        side: BorderSide(color: textColor, width: 1.5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: Text(
                        '${AppStrings.seeMyWork} ↑',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Reveal(child: CvButtons(isDark: isDark)),
              const SizedBox(height: 40),
              Reveal(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 780),
                  child: ContactForm(isDark: isDark),
                ),
              ),
              const SizedBox(height: 48),
              Reveal(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 700 ? 4 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 120,
                  ),
                  itemCount: links.length,
                  itemBuilder: (BuildContext context, int i) {
                    final Map<String, String> link = links[i];
                    return InkWell(
                      onTap: () => ContactService.openUrl(link['url']!),
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.06)
                              : Colors.white.withValues(alpha: 0.65),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.12)
                                : Colors.black.withValues(alpha: 0.08),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              link['label']!,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.5,
                                color: AppColors.orange,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              link['value']!,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
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
