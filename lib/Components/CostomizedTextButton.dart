import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/OTPPage/ViewModelOTPPage.dart';
import 'package:namaagp/SignIn/ViewSignIn.dart';
import 'package:namaagp/SignUp/ViewSignUp.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'package:namaagp/updatePassword/ViewupdateSupabasePassword.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


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
                      print('reached retrieve password in navigator');

                      
        break;

        case 'ResendOTP':
        print('reached Resend OTP in navigator');
        // Navigator.push(context,MaterialPageRoute(builder: (context) =>  ViewAddToBalance()),);
        // resend.Resend_OTP();
        ViewModelOTPPage viewModel = ViewModelOTPPage();
        await viewModel.resendOTP();

        break;

        case "SignInAgain":
        //final supabaseClient = SupabaseClient('https://rpwqxndlhdiqkrejigse.supabase.co', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");
        final supabaseClient =await SupabaseClient(
    'https://rpwqxndlhdiqkrejigse.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
  );
await supabaseClient.auth.signOut();
        //final supabase = supabaseClient.auth.admin
        //await supabaseClient.auth.admin.signOut('EeBqpOvC2qlnd7yz5pZwLQxwqpqbjFI/EagzGi6x91QuQ+A+a3XZf77vbAMrUyaDXaWrNGCzVHyVbqEmdGk6tw==');
        Navigator.push(context,MaterialPageRoute(builder: (context) =>  ViewSignIn()),);
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