import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialIcon extends StatelessWidget {
  final String label;
  const SocialIcon({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
      child: Center(child: Text(label, style: GoogleFonts.cairo(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))),
    );
  }
}

