import 'package:flutter/material.dart';

import '../utlis/app_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 1000;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          // Logo right-aligned for RTL
          if (!isMobile)
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 52,
                ),
              ),
            ),
          Expanded(
            flex: 3,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 24,
              runSpacing: 12,
              children:  [
                _NavItem(label: 'الرئيسية',),
                _NavItem(label: 'من نحن',onPressed: () => AppRouter.instance.goTo(context, AppRoutes.about),
              ),
                _NavItem(label: 'خدماتنا'),
                _NavItem(label: 'شركاتنا'),
                _NavItem(label: 'الأخبار'),
                _NavItem(label: 'اليوم'),
                _NavItem(label: 'البروفايل'),
                _NavItem(label: 'الصور'),
              ],
            ),
          ),
          if (isMobile)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            )
          else
            const SizedBox(width: 52),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.label, this.onPressed});
  final String label;
  final  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:onPressed,
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}


