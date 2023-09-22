import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReturnToPreviousPage extends StatelessWidget {
  final String title;
  
  final double tWidth;
  
  //public var widthh=400;
  //final String placeHolder;

  const ReturnToPreviousPage({
    Key? key,
    required this.title,
    required this.tWidth,
    //final int widthh=400,
    //required this.placeHolder,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: () {
              Navigator.pop(context);
              },
              child: SizedBox(
    width: tWidth,
    height: 55,
    child: Row(
        children: [
             Image.asset(
                  'assets/Icons/LightPurpleArrow.png',
                  width: 30, //310,
                  height: 30, //228.33,
                  fit: BoxFit.fill,
                ),

            Text(title,
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont("Noto Sans Arabic",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  //height: 1.5,
                  textStyle: const TextStyle(color: Color(0xFF9D9AC2))))//0xFF9D9AC2
        ],
    ),
)

            );
  }
}



// Positioned(
//                 left: 0,
//                 top: 0,
//                 child: Container(
//                     width: 323,
//                     height: 55,
//                     decoration: ShapeDecoration(
//                         color: const Color(0xFF3A3462),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(28),
//                         ),
//                         shadows: const [
//                             BoxShadow(
//                                 color: Color(0x3F000000),
//                                 blurRadius: 4,
//                                 offset: Offset(0, 4),
//                                 spreadRadius: 0,
//                             )
//                         ],
//                     ),
//                 ),
//             ),
//             const Positioned(
//                 left: 79,
//                 top: 5,
//                 child: SizedBox(
//                     width: 166,
//                     height: 45,
//                     child: Text(
//                         'إنشاء حساب',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Color(0xFFF8F8FF),
//                             fontSize: 24,
//                             fontFamily: 'Trade Winds',
//                             fontWeight: FontWeight.w400,
//                         ),
//                     ),
//                 ),
//             ),