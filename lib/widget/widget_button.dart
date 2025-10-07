import 'package:flutter/material.dart';

// ==========================================================
// KELAS UTAMA: WidgetButton (Nama baru yang direkomendasikan)
// ==========================================================
class WidgetButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final IconData? icon;

  const WidgetButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white, // Default ke putih
    this.backgroundColor = const Color.fromARGB(255, 69, 71, 70), // Default ke biru yang cerah
    this.width,
    this.height,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 50, // Tinggi default 50
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3, // Sedikit bayangan
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================================
// ALIAS: CustomButton (Untuk kompatibilitas mundur/Backward Compatibility)
// ==========================================================
// Ini memungkinkan file yang masih memanggil CustomButton untuk tetap berfungsi.
class CustomButton extends WidgetButton {
  const CustomButton({
    super.key,
    required super.text,
    required super.onPressed,
    super.textColor,
    super.backgroundColor,
    super.width,
    super.height,
    super.icon,
  });
}
