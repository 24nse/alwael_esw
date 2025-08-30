import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class PetroFaqItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool initiallyExpanded;

  const PetroFaqItem({super.key, required this.question, required this.answer, this.initiallyExpanded = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        title: Text(question, style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w500, color: PetroColors.textDark), textAlign: TextAlign.right),
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(answer, style: GoogleFonts.cairo(fontSize: 16, color: Colors.grey[700]), textAlign: TextAlign.right),
          )
        ],
      ),
    );
  }
}

