import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/SignIn/ViewModelSignIn.dart';
import 'package:namaagp/SignUp/ViewModelSignUp.dart';

class AccountButton extends StatelessWidget {
  final String title;
  final String type;
  final signupObj = new ViewModelSignUp();
  final signinObj = new ViewModelSignIn();
  TextEditingController name;
  TextEditingController phonenumber;
  TextEditingController pin;


   AccountButton({
    Key? key,
    required this.title,
    required this.type,
    required this.name,
    required this.phonenumber,
    required this.pin,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
      onTap: () {//this if statement changes the purpose or the destination of the button
buttonAction();
              },
      child: Row(
        
      children: [
        SizedBox(width: 30,),



Container(
                    width: 323,
                    height: 55,
                    padding: EdgeInsets.all(10),
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
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      textStyle: const TextStyle(color: Color(0xFFD0CDEF)))),
                ),
        
      ],
    )
    ,));
  }
  buttonAction(){
  switch (type.toLowerCase()) {
    case 'signup':
      signupObj.signUp(name.text, phonenumber.text, pin.text);
      print('reached Sign up!!!!');
    break;

    case 'signin':
    signinObj.signIn(phonenumber.text, pin.text);
      print('reached Sign In!!!!');
    break;

    case 'continue':
      print('reached continue!!!!');
    break;
      
    default:
    print('Eroooorrrrrrrrrrr!!!!');
  }
}
}