import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onLearnMore;

  const ServiceCard({super.key, required this.icon, required this.title, required this.description, this.onLearnMore});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: PetroColors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
            child: Icon(icon, size: 30, color: PetroColors.red),
          ),
          const SizedBox(height: 20),
          Text(title, style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold, color: PetroColors.textDark)),
          const SizedBox(height: 15),
          Text(description, style: GoogleFonts.cairo(fontSize: 16, color: Colors.grey[700], height: 1.5), textAlign: TextAlign.center),
          const SizedBox(height: 20),
          InkWell(
            onTap: onLearnMore,
            child: Text('اعرف المزيد', style: GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w600, color: PetroColors.red)),
          )
        ],
      ),
    );
  }
}

