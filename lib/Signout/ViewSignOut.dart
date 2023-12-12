import 'package:flutter/material.dart';
import 'package:namaagp/AddPlan/ViewModelAddPlan.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:namaagp/SignIn/ViewSignIn.dart';
import 'package:namaagp/Signout/ViewModelSignOut.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewSignOut extends StatelessWidget {
  const ViewSignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('تسجيل الخروج',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              "Noto Sans Arabic",
              fontSize: 25,
              color: Color.fromARGB(255, 192, 84, 84),
              fontWeight: FontWeight.w400,
            )),
        content: Text('هل أنت متأكد من تسجيل الخروج؟',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              "Noto Sans Arabic",
              fontSize: 17,
              color: Color.fromARGB(255, 201, 138, 138),
              fontWeight: FontWeight.w400,
            )),
        backgroundColor: Color.fromARGB(174, 56, 56, 56),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFC05454)),
          borderRadius: BorderRadius.circular(20),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(195, 255, 255, 255),
            ),
            child: Text("إلغاء",
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  "Noto Sans Arabic",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(195, 255, 255, 255),
            ),
            child: Text("خروج",
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  "Noto Sans Arabic",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            onPressed: () async {
            ViewModelSignOut().signOut();
              
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  ViewSignIn()),
  );
            },
          )
        ],
        actionsAlignment: MainAxisAlignment.center);
  }
}
