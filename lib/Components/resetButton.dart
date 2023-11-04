import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String type;
  final TextEditingController name;
  final TextEditingController emailAddress;
  //final TextEditingController pin;

  ResetButton({
    Key? key,
    required this.title,
    required this.type,
    required this.name,
    required this.emailAddress,
    //required this.pin,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            const SizedBox(
              width: 50,
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
                  ),
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