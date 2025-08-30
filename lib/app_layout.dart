import 'package:flutter/material.dart';
import 'package:profile_barsh_web/utlis/app_colors.dart';
import 'package:profile_barsh_web/widgets/footer_sections.dart';
import 'package:profile_barsh_web/widgets/header_sections.dart';
import 'package:profile_barsh_web/widgets/primary_button.dart';
import '../utlis/app_router.dart';

class AppLayout extends StatelessWidget {
  final Widget child;

  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:   HeaderSection(
              logoPrefix: 'مؤسسة',
              logoMain: 'الوعل',
              navItems: [
                HeaderNavItem(
                  label: 'الرئيسية',
                  onPressed: () => AppRouter.instance.router.go('/'),
                ),
                HeaderNavItem(
                  label: 'من نحن',
                  onPressed: () => AppRouter.instance.router.go('/about'),
                ),
                HeaderNavItem(label: 'الخدمات', onPressed: () => AppRouter.instance.router.go(AppRoutes.service)),
                HeaderNavItem(label: 'المشاريع', onPressed: () {}),
                HeaderNavItem(label: 'اتصل بنا', onPressed: () {}),
              ],
              trailingButton: PrimaryButton(label: 'اطلب عرض سعر', onPressed: () {}),
            ),


          ),
          SliverToBoxAdapter(
            child: Expanded(child: child),

          ),
          SliverToBoxAdapter(
            child:PetroFooter(),

          ),

        ],

      ),
    );
  }
}
