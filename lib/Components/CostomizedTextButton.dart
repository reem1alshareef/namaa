import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/OTPPage/ViewModelOTPPage.dart';
import 'package:namaagp/SignIn/ViewSignIn.dart';
import 'package:namaagp/SignUp/ViewSignUp.dart';

class CostomizedTextButton extends StatelessWidget {
  final resend = new ViewModelOTPPage();
  final String question;
  final String actionTitle;
  final String purpose;
  
   CostomizedTextButton({
    Key? key,
    required this.question,
    required this.actionTitle,
    required this.purpose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
      onTap: () {//this if statement changes the purpose or the destination of the button

      switch(purpose){

        case 'SignUp':
        print('reached sign up in navigator');
        Navigator.push(context,MaterialPageRoute(builder: (context) =>  ViewSignUp()),);
        break;

        case 'SignIn':
        print('reached sign in in navigator');
        Navigator.push(context,MaterialPageRoute(builder: (context) =>  ViewSignIn()),);
        break;

        case 'retrievePassword':
        print('reached retrieve password in navigator');
        //Navigator.push(context,MaterialPageRoute(builder: (context) => const ViewSignIn()),);
        break;

        case 'ResendOTP':
        print('reached Resend OTP in navigator');
        resend.Resend_OTP();
        break;

        default:
        print('not correct');
      }

  //       Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => const ViewOTPPage()),
  // );
        //resend.Resend_OTP();
              },
      child: Row(
        
      children: [
          SizedBox(width: purpose!='SignUp'?85:65,),
          Text(actionTitle,
              textAlign: TextAlign.right,
              style: GoogleFonts.getFont("Noto Sans Arabic",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  textStyle: const TextStyle(color: Color(0xFF6FA8FF), decoration: TextDecoration.underline)),
                  
                  //textDecoration: ,
                  ),
                  Text(question,
              textAlign: TextAlign.right,
              style: GoogleFonts.getFont("Noto Sans Arabic",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  textStyle: const TextStyle(color: Color(0xFFC5C5CD)))),
        //),
        
      ],
    )
    ,),
      //ResendOTP(),
      alignment: Alignment.center,
      //alignment:
    )
    
    ;
  }
}