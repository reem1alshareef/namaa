import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/OTPPage/ViewModelOTPPage.dart';
import 'package:namaagp/SignIn/ViewSignIn.dart';
import 'package:namaagp/chat/viewChat.dart';
import 'package:namaagp/updatePassword/ViewupdateSupabasePassword.dart';
import 'package:namaagp/SignUp/ViewSignUp.dart';
import 'package:namaagp/services/authentication_service.dart';


class CostomizedTextButton extends StatelessWidget {
  final resend = ViewModelOTPPage();
  final String question;
  final String actionTitle;
  final String purpose;
  
  CostomizedTextButton({
    Key? key,
    required this.question,
    required this.actionTitle,
    required this.purpose,
    //required this.formKey, 
    //required GlobalKey<FormState> validationKey
  }) : super(key: key);

String? get emailAddress => ViewSignIn.emailAddress.text;

String? currentEmail() {
  final String? cemail = AuthenticationService.currentUser?.email;
  return cemail;
}

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
      onTap: () async {//this if statement changes the purpose or the destination of the button

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
        Navigator.push(context,MaterialPageRoute(builder: (context) =>  ViewupdateSupabasePassword()),);
                      
                      
        break;

        case 'ResendOTP':
        print('reached Resend OTP in navigator');
        // Navigator.push(context,MaterialPageRoute(builder: (context) =>  ViewAddToBalance()),);
        // resend.Resend_OTP();
        ViewModelOTPPage viewModel = ViewModelOTPPage();
        await viewModel.resendOTP();

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
          SizedBox(width: purpose != 'ResendOTP'? purpose!='SignUp'?85:50:60,),
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
      //alignment:
    )
    
    ;
  }
}
