import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/IncomeDetails/ViewModelIncomeDetails.dart';
import 'package:namaagp/OTPPage/ViewOTPPage.dart';
import 'package:namaagp/SignIn/ViewModelSignIn.dart';
import 'package:namaagp/SignUp/ViewModelSignUp.dart';

// ignore: must_be_immutable
class AccountButton extends StatelessWidget {
  final String title;
  final String type;
  final signupObj = ViewModelSignUp();
  final signinObj = ViewModelSignIn();
  TextEditingController name;
  TextEditingController emailAddress;
  TextEditingController pin;
  
  GlobalKey<FormState> validationKey;
  //final GlobalKey<FormState>() validationKey;

  

   AccountButton({
    Key? key,
    required this.title,
    required this.type,
    required this.name,
    required this.emailAddress,
    required this.pin,
    required this.validationKey

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
      onTap: () async {//this if statement changes the purpose or the destination of the button
      switch (type.toLowerCase()) {
    case 'signup':
      await signupObj.signUp(name.text, emailAddress.text, pin.text);
      Navigator.push(context,MaterialPageRoute(builder: (context) =>  ViewOTPPage(emailAddress: emailAddress.text, type: 'SignUp')),);
      print('reached Sign up!!!!');
    break;

    case 'signin':
    bool completed = await signinObj.signIn(emailAddress.text, pin.text, validationKey);
    if (completed)
          Navigator.push(context,MaterialPageRoute(builder: (context) =>  ViewOTPPage(emailAddress: emailAddress.text, type: 'SignIn')),);
      print('reached Sign In!!!!');
    break;

    case 'continue':
      ViewModelIncomeDetails().addIncomeDetails(name.text, emailAddress.text, pin.text);
      print('reached continue!!!!');
    break;
      
    default:
    print('Eroooorrrrrrrrrrr!!!!');
  }
//buttonAction();
              },
      child: Row(
        
      children: [
        const SizedBox(width: 50,),



Container(
                    width: 250,//323,
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
                    child: Text(title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont("Noto Sans Arabic",
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      textStyle: const TextStyle(color: Color(0xFFD0CDEF)))),
                ),
        
      ],
    )
    ,));
    
  }
}