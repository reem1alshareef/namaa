import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class introPagesHeader extends StatelessWidget {
  //final String title;
  final String subTitle;

  const introPagesHeader({
    Key? key,
    //required this.title,
    required this.subTitle,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

Align(
                        alignment: Alignment.topRight,
         child: Row(
                          children: [
                            const SizedBox(width: 105),
                            Image.asset(
                              'assets/NamaaLogo.png',
                              width: 207.46,//310,
                              height: 152.8,//228.33,
                              fit: BoxFit.fill,
                            ),
                          ],
                        )),
                        SizedBox(
                      height: 90,
                      child: Text('نماء',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont("Noto Sans Arabic",
                              fontSize: 64,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              textStyle:
                                  const TextStyle(color: Color(0xFF958EC8)))),
                    ),
                    Row(children: [
                      
                      SizedBox(
                        width: 379,
                      //height: 90,
                      child: Text(subTitle,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.getFont("Noto Sans Arabic",
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              textStyle:
                                  const TextStyle(color: Color(0xFFD0CDEF)))),
                    ),//const SizedBox(width: 105),
                    ],)
                    
      ],
    );
  }
}