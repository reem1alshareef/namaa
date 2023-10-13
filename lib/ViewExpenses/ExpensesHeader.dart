import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/Components/ReturnToPreviousPage.dart';

class ExpensesHeader extends StatelessWidget {
  //final String title;
  //final String subTitle;

  const ExpensesHeader({
    Key? key,
    //required this.title,
    //required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ReturnToPreviousPage(title: 'العودة', tWidth: 69,),
        Text('جميع المصروفات',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont("Noto Sans Arabic",
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      textStyle: const TextStyle(color: Color(0xFFD0CDEF)))),
        GestureDetector(
          onTap: () {
            print('filter object');
          },
          child: Container(
            width: 30,
            height: 21.8,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Icons/filter.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

