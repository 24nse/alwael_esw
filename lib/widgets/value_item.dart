import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class ValueItem extends StatelessWidget {
  final String title;
  final String description;

  const ValueItem({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Container(width: 12, height: 12, decoration: const BoxDecoration(color: PetroColors.red, shape: BoxShape.circle)),
        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold, color: PetroColors.textDark)),
              Text(description, style: GoogleFonts.cairo(fontSize: 16, color: Colors.grey[700]), textAlign: TextAlign.right),
            ],
          ),
        ),
      ],
    );
  }
}

