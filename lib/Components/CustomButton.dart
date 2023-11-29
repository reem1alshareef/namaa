import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  CustomButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            SizedBox(
              width: 45,
            ),
            Container(
              width: 250,
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: const Color(0xFF3A3462),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  "Noto Sans Arabic",
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  textStyle: const TextStyle(color: Color(0xFFD0CDEF)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}