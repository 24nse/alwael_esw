import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utlis/app_router.dart';

class HeaderSection extends StatelessWidget {
  final String logoPrefix;
  final String logoMain;
  final Color logoPrefixColor;
  final Color logoMainColor;
  final List<HeaderNavItem> navItems;
  final Widget? trailingButton;

  const HeaderSection({
    super.key,
    required this.logoPrefix,
    required this.logoMain,
    this.logoPrefixColor = const Color(0xFF1E3A8A),
    this.logoMainColor = const Color(0xFFDC2626),
    required this.navItems,
    this.trailingButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Text(
                logoPrefix,
                style: GoogleFonts.cairo(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: logoPrefixColor,
                ),
              ),
              Text(
                logoMain,
                style: GoogleFonts.cairo(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: logoMainColor,
                ),
              ),
            ],
          ),

          // Navigation + optional trailing button
          Row(
            children: [
              ...navItems.map((item) => _NavItem(label: item.label, onPressed: item.onPressed)),
              if (trailingButton != null) ...[
                const SizedBox(width: 20),
                trailingButton!,
              ]
            ],
          ),
        ],
      ),
    );
  }
}

// Navigation item model
class HeaderNavItem {
  final String label;
  final VoidCallback? onPressed;

  HeaderNavItem({required this.label, this.onPressed});
}

// Internal _NavItem widget
class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const _NavItem({required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: GoogleFonts.cairo(
          fontSize: 16,
          color: const Color(0xFF1E3A8A),
        ),
      ),
    );
  }
}
