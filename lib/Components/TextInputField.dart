import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInputField extends StatelessWidget {
  final String title;
  final String placeHolder;

  const TextInputField({
    Key? key,
    required this.title,
    required this.placeHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 350,
          height: 25,
          child: Text(title,
              textAlign: TextAlign.right,
              style: GoogleFonts.getFont("Noto Sans Arabic",
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  textStyle: const TextStyle(color: Color(0xFFC5C5CD)))),
        ),
        SizedBox(
            width: 350,
            height: 35,
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: placeHolder,
                hintStyle: TextStyle(
                    color: Color(0xFF898B99), height: 1, fontSize: 18),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.7, color: Color(0xFFB8BAC2)), //<-- SEE HERE
                ),
              ),
            )),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
