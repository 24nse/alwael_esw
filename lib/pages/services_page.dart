import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeShell extends StatelessWidget {
  const HomeShell({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Column(
          children: const [
            HeroBanner(),
            SizedBox(height: 36),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: ServicesGrid(),
            ),
            SizedBox(height: 36),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: ResponsiveTwoColumn(
                left: FAQSection(),
                right: QuestionsCard(),
              ),
            ),
            SizedBox(height: 48),
            LargeCTA(),
          ],
        ),

    );
  }
}

/// ----------------------------
/// Hero Banner
/// ----------------------------
class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // constraints: const BoxConstraints(minHeight: 100),
          height: 450,
          width: double.infinity,
          child: Image.asset(
            'assets/images/house.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.45),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 36),
                Text('الرئيسية  •  الخدمات',
                    style: GoogleFonts.cairo(
                        color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 12),
                Text('خدماتنا',
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// ----------------------------
/// Services Grid (Static Data)
/// ----------------------------
class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key});

  final List<_ServiceCardData> items = const [
    _ServiceCardData(
        title: 'الطاقة الحرارية',
        subtitle:
        'نختص في تصميم وتحسين محطات الطاقة الحرارية لتوليد الكهرباء بكفاءة.'),
    _ServiceCardData(
        title: 'منصة استخراج النفط',
        subtitle: 'نوفر حلول تشغيل آمنة وفعالة لمنصات استخراج النفط البحرية.'),
    _ServiceCardData(
        title: 'انبعاثات احتراق الغاز',
        subtitle: 'خبرة في تقليل انبعاثات احتراق الغاز للحفاظ على البيئة.'),
    _ServiceCardData(
        title: 'استخراج زيت المضخة',
        subtitle: 'نقوم بتقييمات شاملة لتحسين إنتاج المضخات الزيتية.'),
    _ServiceCardData(
        title: 'تكرير منتجات النفط',
        subtitle: 'ندعم تشغيل وتطوير مصافي النفط لمواكبة الطلب المتزايد.'),
    _ServiceCardData(
        title: 'تحسين أعمال المصانع',
        subtitle:
        'نساعد المصانع على زيادة الإنتاجية وتقليل التكاليف وتحسين الاستدامة.'),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      int columns = 3;
      double w = constraints.maxWidth;
      if (w < 700) columns = 1;
      else if (w < 1100) columns = 2;

      return Wrap(
        spacing: 20,
        runSpacing: 20,
        children: items.map((itm) {
          final width = (w - (columns - 1) * 20) / columns;
          return _ServiceCard(width: width, data: itm);
        }).toList(),
      );
    });
  }
}

class _ServiceCardData {
  final String title;
  final String subtitle;
  const _ServiceCardData({required this.title, required this.subtitle});
}

class _ServiceCard extends StatelessWidget {
  final double width;
  final _ServiceCardData data;
  const _ServiceCard({required this.width, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: 160),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Color(0xFFDC2626),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.miscellaneous_services,
                  color: Colors.white, size: 20),
            ),
          ),
          const SizedBox(height: 18),
          Text(data.title,
              style: GoogleFonts.cairo(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF052235))),
          const SizedBox(height: 10),
          Text(data.subtitle,
              style: GoogleFonts.cairo(
                fontSize: 13,
                color: Color(0xFF6B7280),
              )),
          const SizedBox(height: 8),
          Text("LEARN MORE",
              style: GoogleFonts.cairo(
                fontSize: 12,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
                color: Color(0xFF052235),
              )),
        ],
      ),
    );
  }
}

/// ----------------------------
/// Questions sidebar card
/// ----------------------------
class QuestionsCard extends StatelessWidget {
  const QuestionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 520,
      padding: const EdgeInsets.all(26),
      margin: const EdgeInsets.only(left: 20, top: 40),
      decoration: BoxDecoration(
        color: const Color(0xFF052235),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('أسئلة من العملاء',
              style: GoogleFonts.cairo(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          const SizedBox(height: 16),
          _FAQItem(
              title: 'ما الذي تتخصص فيه مؤسسة بارشيد؟',
              description:
              'نحن نقدم خبرات في استكشاف وإنتاج النفط والغاز، وإدارة البيانات، وتحسين الحفر.'),
          _FAQItem(
              title: 'كيف تساعد بارشيد في تحسين العمليات؟',
              description:
              'نساعد في تحسين الأداء وتقليل التكاليف وزيادة كفاءة التشغيل.'),
          _FAQItem(
              title: 'هل تدعم مشاريع الطاقة المتجددة؟',
              description:
              'نعم، نقدم استشارات لدراسات بيئية وخطط مشاريع الطاقة.'),
        ],
      ),
    );
  }
}

class _FAQItem extends StatelessWidget {
  final String title;
  final String description;
  const _FAQItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Colors.white70,
      iconColor: Colors.white,
      title: Text(title,
          style: GoogleFonts.cairo(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14)),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: Text(description,
              style: GoogleFonts.cairo(color: Colors.white70, fontSize: 13)),
        )
      ],
    );
  }
}

/// ----------------------------
/// FAQ left
/// ----------------------------
class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('أسئلة شائعة',
              style: GoogleFonts.cairo(
                  fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text('لماذا تختار مؤسسة بارشيد؟',
              style: GoogleFonts.cairo(fontSize: 14, color: Colors.black87)),
          const SizedBox(height: 6),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              padding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            ),
            child: Text('اطرح سؤالاً', style: GoogleFonts.cairo()),
          )
        ],
      ),
    );
  }
}

/// ----------------------------
/// Responsive two-column
/// ----------------------------
class ResponsiveTwoColumn extends StatelessWidget {
  final Widget left;
  final Widget right;
  const ResponsiveTwoColumn({required this.left, required this.right, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1000) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: left),
            const SizedBox(width: 24),
            Expanded(child: right),
          ],
        );
      } else {
        return Column(
          children: [left, const SizedBox(height: 18), right],
        );
      }
    });
  }
}

/// ----------------------------
/// Large CTA
/// ----------------------------
class LargeCTA extends StatelessWidget {
  const LargeCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 36),
          height: 320,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/house.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.45),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('هل أنت مستعد لتحويل عمليات الطاقة؟',
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('مؤسسة بارشيد جاهزة لدعم احتياجات شركتكم.',
                    style: GoogleFonts.cairo(color: Colors.white70)),
                const SizedBox(height: 16),
                SizedBox(
                  width: 240,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDC2626)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text('اطلب عرض سعر',
                          style: GoogleFonts.cairo(color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

