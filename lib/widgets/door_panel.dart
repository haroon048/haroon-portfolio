import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haroon_portfolio/constants/app_colors.dart';
import 'package:haroon_portfolio/model/service_model.dart';
import 'package:haroon_portfolio/provider/site_provider.dart';
import 'package:provider/provider.dart';

class DoorPanel extends StatelessWidget {
  const DoorPanel({super.key, required this.service, required this.onSeeWork});

  final ServiceModel service;
  final VoidCallback onSeeWork;

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 900;
    final Widget bullets = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: service.bullets.map((String bullet) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Icon(
                Icons.check_circle,
                size: 20,
                color: AppColors.mint,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  bullet,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.55,
                    color: AppColors.inkLight,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
    final Widget tags = Wrap(
      spacing: 10,
      runSpacing: 10,
      children: service.tags.map((String tag) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
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
    );
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: Container(
        key: ValueKey<String>(service.key),
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.slate,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.gold, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      service.iconLetter,
                      style: GoogleFonts.archivo(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.gold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    service.title,
                    style: GoogleFonts.archivo(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.inkLight,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => context.read<SiteProvider>().setOpenDoor(
                        service.key,
                      ),
                  icon: const Icon(Icons.close, color: Colors.white70),
                  tooltip: 'Close',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              service.description,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.65,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 24),
            if (isWide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: bullets),
                  const SizedBox(width: 32),
                  Expanded(child: tags),
                ],
              )
            else ...<Widget>[
              bullets,
              const SizedBox(height: 20),
              tags,
            ],
            if (service.key == 'apps') ...<Widget>[
              const SizedBox(height: 28),
              ElevatedButton(
                onPressed: onSeeWork,
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
                  'See the stacked case studies',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
            if (service.key == 'bugs') ...<Widget>[
              const SizedBox(height: 28),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '\$ flutter analyze',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '✗ RenderFlex overflowed by 42 pixels — product_card.dart',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFFF8A80),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '→ traced to a fixed-height row, rebuilt it flexible',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '✓ No issues found! Verified on a real device.',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mint,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
