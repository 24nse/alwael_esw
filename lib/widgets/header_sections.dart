import 'package:flutter/material.dart';
import 'package:profile_barsh_web/utlis/app_colors.dart';
import 'package:profile_barsh_web/utlis/app_text_styles.dart';
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
        boxShadow: [
          BoxShadow(
            color: AppColors.kBackgroundColor2,

            // color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          SizedBox(
              height: 90,
              width: 200,
              child: Image.asset('assets/images/logo.png')),
          // Row(
          //   children: [
          //     Text(
          //       logoPrefix,
          //       style:AppTextStyles.styleBold29(context)
          //     ),
          //     Text(
          //       logoMain,
          //       style:AppTextStyles.styleBold29(context).copyWith(color: AppColors.kPrimaryColor)
          //     ),
          //   ],
          // ),

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
        style: AppTextStyles.styleRegular16(context)
      ),
    );
  }
}
