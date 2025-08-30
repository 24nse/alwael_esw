

// About Page (مؤسسة بارشيد) – MVVM, clean, responsive
// -----------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utlis/app_router.dart';
import '../widgets/header_sections.dart';
import '../widgets/primary_button.dart';

// ------------------------------ THEME ----------------------------------------
class PetroTheme {
  PetroTheme._();

  static const Color primary = Color(0xFF0F172A);
  static const Color accentRed = Color(0xFFDC2626);
  static const Color linkBlue = Color(0xFF1E3A8A);
  static const Color bg = Color(0xFFF7F8FA);
  static const Color darkPanel = Color(0xFF0C2A3B);
  static const Color midBlue = Color(0xFF0F2F44);
  static const Color lightGrey = Color(0xFFEEF1F4);
  static const Color textMuted = Color(0xFF6B7280);

  static TextTheme textTheme = const TextTheme(
    displayLarge: TextStyle(fontSize: 56, fontWeight: FontWeight.w700, height: 1.1),
    displayMedium: TextStyle(fontSize: 42, fontWeight: FontWeight.w700, height: 1.2),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.6),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.6),
  );
}

// ------------------------------ MODELS ---------------------------------------
class ProgressItem {
  final String label;
  final double percent;
  ProgressItem({required this.label, required this.percent});
}

class TeamMember {
  final String name;
  final String role;
  final String imageAsset;
  TeamMember({required this.name, required this.role, required this.imageAsset});
}

class AwardItem {
  final String title;
  final String year;
  AwardItem({required this.title, required this.year});
}

// ------------------------------ VIEWMODEL ------------------------------------
class AboutViewModel extends ChangeNotifier {
  final String heroTitle = 'عن المؤسسة';
  final String heroBreadcrumb = 'الرئيسية   >   عن المؤسسة';
  final String heroBg = 'assets/images/house.jpg';

  final String snapshotTitle = 'نظرة أقرب إلى مؤسستنا';
  final String snapshotBody =
      'مؤسسة بارشيد للمقاولات العامة والعقارات تقدم حلول متكاملة في البناء وإدارة المشاريع بمعايير عالية من الجودة والسلامة.';

  final List<ProgressItem> progress = <ProgressItem>[
    ProgressItem(label: 'رضا العملاء', percent: 0.90),
    ProgressItem(label: 'إنجاز المشاريع', percent: 0.70),
    ProgressItem(label: 'الالتزام بالسلامة', percent: 0.95),
  ];

  final String aboutPanelKicker = 'من نحن';
  final String aboutPanelTitle = 'ماذا نقدم في مجال المقاولات والعقارات';
  final String aboutPanelBody =
      'نفتخر بخبراتنا الطويلة في تقديم خدمات المقاولات العامة وإدارة المشاريع العقارية. '
      'نعمل على التخطيط والتنفيذ والتسليم ضمن الميزانية والوقت المحدد مع أعلى معايير الجودة.';

  final List<Map<String, String>> timeline = [
    {'year': '2015', 'subtitle': 'تأسيس المؤسسة'},
    {'year': '2017', 'subtitle': 'أول مشروع إنشائي ضخم'},
    {'year': '2020', 'subtitle': 'توسّع في مشاريع العقارات'},
    {'year': '2023', 'subtitle': 'استمرار النمو والابتكار'},
  ];

  final List<TeamMember> team = <TeamMember>[
    TeamMember(name: 'محمد بارشيد', role: 'المدير التنفيذي', imageAsset: 'assets/images/n1.jpg'),
    TeamMember(name: 'أحمد علي', role: 'مدير المالية', imageAsset: 'assets/images/n2.jpg'),
    TeamMember(name: 'سالم الحضرمي', role: 'مدير العمليات', imageAsset: 'assets/images/n3.jpg'),
  ];

  final List<AwardItem> awards = <AwardItem>[
    AwardItem(title: 'جائزة التميز في الاستدامة', year: '2019'),
    AwardItem(title: 'جائزة الريادة البيئية', year: '2020'),
    AwardItem(title: 'أفضل شركة مقاولات للعام', year: '2021'),
    AwardItem(title: 'جائزة الابتكار في المشاريع العقارية', year: '2022'),
  ];

  final List<String> partnerLogos = List.generate(6, (i) =>  'assets/images/house.jpg');
}

// ------------------------------ VIEW (PAGE) ----------------------------------
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = AboutViewModel();
    final width = MediaQuery.of(context).size.width;
    final horizontal = width >= 1400
        ? 120.0
        : width >= 1100
        ? 80.0
        : width >= 900
        ? 48.0
        : 24.0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section

            _HeroSection(vm: vm, horizontal: horizontal)
                .animate().fadeIn(duration: 800.ms),
            _AboutSnapshot(vm: vm, horizontal: horizontal)
                .animate().slideX(begin: 0.2, duration: 900.ms),
            const SizedBox(height: 40),
            _AboutPanel(vm: vm, horizontal: horizontal)
                .animate().fadeIn(duration: 900.ms),
            const SizedBox(height: 40),
            _Timeline(vm: vm, horizontal: horizontal)
                .animate().slideY(begin: 0.2, duration: 900.ms),
            const SizedBox(height: 40),
            _Team(vm: vm, horizontal: horizontal)
                .animate().fadeIn(duration: 900.ms),
            const SizedBox(height: 40),
            _Awards(vm: vm, horizontal: horizontal)
                .animate().slideX(begin: -0.2, duration: 900.ms),
            const SizedBox(height: 30),
            _LogoStrip(vm: vm, horizontal: horizontal),
            const SizedBox(height: 40),
            _CTASection(horizontal: horizontal),
          ],
        ),

    );
  }
}
// ------------------------------ HERO -----------------------------------------
class _HeroSection extends StatelessWidget {
  final AboutViewModel vm;
  final double horizontal;
  const _HeroSection({required this.vm, required this.horizontal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 320,
          width: double.infinity,
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.darken),
            child: Image.asset(vm.heroBg, fit: BoxFit.cover),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontal),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(vm.heroBreadcrumb, style: PetroTheme.textTheme.bodyMedium!.copyWith(color: Colors.white70)),
                  const SizedBox(height: 8),
                  Text(
                      vm.heroTitle,
                      style: PetroTheme.textTheme.displayLarge?.copyWith(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
        // Corner decorative squares (right)
        Positioned(right: 18, top: 24, child: _Square(size: 12, color: Colors.white)),
        Positioned(right: 0, bottom: 26, child: Row(children: const [_Square(size: 12, color: Colors.white), SizedBox(width: 6), _Square(size: 18, color: PetroTheme.midBlue), SizedBox(width: 6), _Square(size: 12, color: PetroTheme.accentRed)])),
      ],
    );
  }
}

class _Square extends StatelessWidget {
  final double size;
  final Color color;
  const _Square({required this.size, required this.color});
  @override
  Widget build(BuildContext context) => Container(width: size, height: size, color: color);
}

// ------------------------------ SNAPSHOT (IMAGE + PROGRESS) ------------------
class _AboutSnapshot extends StatelessWidget {
  final AboutViewModel vm;
  final double horizontal;
  const _AboutSnapshot({required this.vm, required this.horizontal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left image with play button
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: PetroTheme.lightGrey),
                      image: const DecorationImage(image: AssetImage('assets/images/p1.jpg'), fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: -20,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(backgroundColor: PetroTheme.accentRed, padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('شاهد فيديو', textAlign: TextAlign.left),
                  ),
                ),
                // Small white square decoration top-right
                Positioned(top: 12, right: 12, child: _Square(size: 12, color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(width: 32),
          // Right content with progress bars
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(vm.snapshotTitle, style: PetroTheme.textTheme.displayMedium?.copyWith(color: PetroTheme.linkBlue)),
                const SizedBox(height: 12),
                Text(vm.snapshotBody, style: PetroTheme.textTheme.bodyLarge!.copyWith(color: PetroTheme.textMuted)),
                const SizedBox(height: 24),
                ...vm.progress.map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _LabeledProgress(label: e.label, value: e.percent),
                    )),
                const SizedBox(height: 8),
                TextButton(onPressed: () {}, child: const Text('المزيد عنا')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LabeledProgress extends StatelessWidget {
  final String label;
  final double value;
  const _LabeledProgress({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: PetroTheme.textTheme.bodyMedium!.copyWith(color: Colors.black87, fontWeight: FontWeight.w600)),
            Text('${(value * 100).round()}%', style: PetroTheme.textTheme.bodyMedium!.copyWith(color: Colors.black87, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: 8,
            child: Stack(children: [
              Container(color: PetroTheme.lightGrey),
              FractionallySizedBox(widthFactor: value, child: Container(color: PetroTheme.accentRed)),
            ]),
          ),
        ),
      ],
    );
  }
}

// ------------------------------ DARK ABOUT PANEL -----------------------------
class _AboutPanel extends StatelessWidget {
  final AboutViewModel vm;
  final double horizontal;
  const _AboutPanel({required this.vm, required this.horizontal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(32, 28, 32, 40),
            decoration: BoxDecoration(color: PetroTheme.darkPanel, borderRadius: BorderRadius.circular(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(vm.aboutPanelKicker, style: PetroTheme.textTheme.bodyMedium!.copyWith(color: Colors.white60, letterSpacing: 1.2)),
                const SizedBox(height: 8),
                Text(vm.aboutPanelTitle, style: PetroTheme.textTheme.displayMedium?.copyWith(color: Colors.white)),
                const SizedBox(height: 12),
                Text(vm.aboutPanelBody, style: PetroTheme.textTheme.bodyLarge!.copyWith(color: Colors.white70)),
              ],
            ),
          ),
          Positioned(
            right: -18,
            bottom: -18,
            child: Row(children: const [_Square(size: 18, color: Colors.white), SizedBox(width: 8), _Square(size: 14, color: PetroTheme.accentRed)]),
          ),
        ],
      ),
    );
  }
}

// ------------------------------ TIMELINE -------------------------------------
class _Timeline extends StatelessWidget {
  final AboutViewModel vm;
  final double horizontal;
  const _Timeline({required this.vm, required this.horizontal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 28),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4), boxShadow: [BoxShadow(color: Colors.black12.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 4))]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: vm.timeline.map((t) => _TimelineItem(year: t['year']!, subtitle: t['subtitle']!)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String year;
  final String subtitle;
  const _TimelineItem({required this.year, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(year, style: PetroTheme.textTheme.displayMedium?.copyWith(color: PetroTheme.accentRed)),
        const SizedBox(height: 6),
        SizedBox(
          width: 220,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: PetroTheme.textTheme.bodyLarge!.copyWith(color: Colors.black87, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

// ------------------------------ TEAM -----------------------------------------
class _Team extends StatelessWidget {
  final AboutViewModel vm;
  final double horizontal;
  const _Team({required this.vm, required this.horizontal});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossCount = width >= 1300 ? 3 : width >= 900 ? 2 : 1;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(kicker: 'الفريق', title: 'خبرائنا', withArrows: true),
          const SizedBox(height: 16),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: vm.team.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 4 / 3,
            ),
            itemBuilder: (_, i) => _TeamCard(member: vm.team[i]),
          ),
        ],
      ),
    );
  }
}

class _TeamCard extends StatelessWidget {
  final TeamMember member;
  const _TeamCard({required this.member});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: [
          Positioned.fill(child: Image.asset(member.imageAsset, fit: BoxFit.cover)),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              color: Colors.black.withOpacity(0.45),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(member.name, style: PetroTheme.textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 4),
                        Text(member.role, style: PetroTheme.textTheme.bodyMedium!.copyWith(color: Colors.white70)),
                      ],
                    ),
                  ),
                  Container(width: 36, height: 36, alignment: Alignment.center, decoration: const BoxDecoration(color: PetroTheme.midBlue), child: const Text('TW', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
                  const SizedBox(width: 6),
                  Container(width: 36, height: 36, alignment: Alignment.center, decoration: const BoxDecoration(color: PetroTheme.midBlue), child: const Text('IG', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
                  const SizedBox(width: 6),
                  Container(width: 36, height: 36, alignment: Alignment.center, decoration: const BoxDecoration(color: PetroTheme.midBlue), child: const Text('FB', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
                  const SizedBox(width: 6),
                  Container(width: 36, height: 36, alignment: Alignment.center, decoration: const BoxDecoration(color: PetroTheme.midBlue), child: const Text('IN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------ AWARDS ---------------------------------------
class _Awards extends StatelessWidget {
  final AboutViewModel vm;
  final double horizontal;
  const _Awards({required this.vm, required this.horizontal});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossCount = width >= 1400 ? 4 : width >= 1100 ? 3 : width >= 800 ? 2 : 1;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(kicker: 'الجوائز', title: 'إنجازاتنا في العمل'),
          const SizedBox(height: 16),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: vm.awards.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 4 / 2.2,
            ),
            itemBuilder: (_, i) => _AwardCard(item: vm.awards[i], index: i),
          ),
        ],
      ),
    );
  }
}

class _AwardCard extends StatelessWidget {
  final AwardItem item;
  final int index;
  const _AwardCard({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    final bool isRed = index == 1; // make the middle card red like design
    return Container(
      decoration: BoxDecoration(
        color: isRed ? PetroTheme.accentRed : Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [BoxShadow(color: Colors.black12.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(item.year, style: PetroTheme.textTheme.titleLarge!.copyWith(color: isRed ? Colors.white : PetroTheme.linkBlue, fontWeight: FontWeight.w700)),
          ),
          Center(
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: PetroTheme.textTheme.headlineMedium!.copyWith(color: isRed ? Colors.white : PetroTheme.primary),
            ),
          ),
          Positioned(bottom: 10, left: 10, child: Row(children: [
            _Square(size: 14, color: isRed ? Colors.white : PetroTheme.accentRed),
            const SizedBox(width: 6),
            _Square(size: 10, color: PetroTheme.midBlue),
          ])),
        ],
      ),
    );
  }
}

// ------------------------------ LOGO STRIP -----------------------------------
class _LogoStrip extends StatelessWidget {
  final AboutViewModel vm;
  final double horizontal;
  const _LogoStrip({required this.vm, required this.horizontal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 16,
        children: vm.partnerLogos
            .map((p) => SizedBox(width: 150, height: 50, child: Image.asset(p, fit: BoxFit.contain)))
            .toList(),
      ),
    );
  }
}

// ------------------------------ CTA ------------------------------------------
class _CTASection extends StatelessWidget {
  final double horizontal;
  const _CTASection({required this.horizontal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      color: PetroTheme.midBlue,
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 40),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'نحن مستعدون لتقديم الحلول لك.',
              style: PetroTheme.textTheme.displayMedium?.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'أدخل بريدك الالكتروني ...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(6)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: 48,
                  child: FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: PetroTheme.accentRed, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                    onPressed: () {},
                    child: const Text('إشتراك'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



// ------------------------------ SECTION HEADER -------------------------------
class _SectionHeader extends StatelessWidget {
  final String kicker;
  final String title;
  final bool withArrows;
  const _SectionHeader({required this.kicker, required this.title, this.withArrows = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(kicker.toUpperCase(), style: PetroTheme.textTheme.bodyMedium!.copyWith(color: PetroTheme.accentRed, letterSpacing: 1.2)),
              const SizedBox(height: 6),
              Text(title, style: PetroTheme.textTheme.displayMedium?.copyWith(color: PetroTheme.primary)),
            ],
          ),
        ),
        if (withArrows)
          Row(children: [
            _ArrowBtn(icon: Icons.chevron_left, onTap: () {}),
            const SizedBox(width: 8),
            _ArrowBtn(icon: Icons.chevron_right, onTap: () {}),
          ])
      ],
    );
  }
}

class _ArrowBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _ArrowBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(border: Border.all(color: PetroTheme.lightGrey), borderRadius: BorderRadius.circular(4)),
        child: Icon(icon, size: 20, color: Colors.black87),
      ),
    );
  }
}

// // ------------------------------ HOW TO USE -----------------------------------
// // In your main.dart:
// // void main() {
// //   runApp(const MaterialApp(home: AboutPage()));
// // }
// // Ensure the assets exist and are declared in pubspec.yaml:
// // assets:
// //   - assets/images/plant_hero.jpg
// //   - assets/images/plant_left.jpg
// //   - assets/images/team1.jpg
// //   - assets/images/team2.jpg
// //   - assets/images/team3.jpg
// //   - assets/images/logo_placeholder.png
