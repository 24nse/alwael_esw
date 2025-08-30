import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_barsh_web/utlis/app_colors.dart';
import 'app_colors.dart';

class ProgressBar extends StatelessWidget {
  final String label;
  final double value; // 0..1

  const ProgressBar({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.kTextColor)),

            Text('${(value * 100).toInt()}%', style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.kPrimaryColor)),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 8,
          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(4)),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,

            widthFactor: value,
            child: Container(decoration: BoxDecoration(color: AppColors.kPrimaryColor, borderRadius: BorderRadius.circular(4))),
          ),
        ),
      ],
    );
  }
}

