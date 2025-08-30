import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;

  const PrimaryButton({super.key, required this.label, this.onPressed, this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 15), this.borderRadius = const BorderRadius.all(Radius.circular(5))});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: borderRadius as BorderRadius?,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(color: PetroColors.red, borderRadius: borderRadius),
        child: Text(label, style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
      ),
    );
  }
}

