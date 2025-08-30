// 📂 shared/widgets/petro_footer.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetroFooter extends StatelessWidget {
  const PetroFooter({super.key});

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: GoogleFonts.cairo(
          fontSize: 14,
          color: Colors.white.withOpacity(0.8),
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: const Color(0xFF1E3A8A),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Right column
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'بارشيد',
                          style: GoogleFonts.cairo(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFDC2626),
                          ),
                        ),
                        Text(
                          'مؤسسة',
                          style: GoogleFonts.cairo(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'حلول المقاولات العامة والبناء بإدارة مشاريع احترافية وجودة تنفيذ عالية.',
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text("🌐 تويتر", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 15),
                        Text("📷 انستغرام", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 15),
                        Text("📘 فيسبوك", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 15),
                        Text("💼 لينكد إن", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              // Services column
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الخدمات',
                      style: GoogleFonts.cairo(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildFooterLink('الطاقة الحرارية للمصنع'),
                    _buildFooterLink('منصة تعدين النفط'),
                    _buildFooterLink('انبعاثات حرق الغاز'),
                    _buildFooterLink('احتياطي مضخة النفط'),
                    _buildFooterLink('مصفاة جودة النفط'),
                    _buildFooterLink('إدارة المصنع'),
                  ],
                ),
              ),
              // Contact column
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اتصل بنا',
                      style: GoogleFonts.cairo(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildFooterLink('رقم الهاتف'),
                    _buildFooterLink('عنوان الشارع'),
                    _buildFooterLink('وسائل التواصل الاجتماعي'),
                    _buildFooterLink('موقع المقر الرئيسي'),
                    _buildFooterLink('لوحة الرسائل'),
                    _buildFooterLink('دعم العملاء'),
                  ],
                ),
              ),
              // Company column
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الشركة',
                      style: GoogleFonts.cairo(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildFooterLink('من نحن'),
                    _buildFooterLink('خبراتنا'),
                    _buildFooterLink('آراء العملاء'),
                    _buildFooterLink('الوظائف'),
                    _buildFooterLink('المشاريع'),
                    _buildFooterLink('مجلة العمل'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDC2626),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Row(
                  children: [
                    _buildFooterLink('خريطة الموقع'),
                    const SizedBox(width: 20),
                    _buildFooterLink('شروط الخدمة'),
                    const SizedBox(width: 20),
                    _buildFooterLink('الخصوصية'),
                  ],
                ),
                Text(
                  'جميع الحقوق محفوظة © 2023.',
                  style: GoogleFonts.cairo(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
