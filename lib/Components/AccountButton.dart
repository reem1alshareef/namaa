import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/IncomeDetails/ViewModelIncomeDetails.dart';
import 'package:namaagp/NavigationBar/NavigationBar.dart';
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

  AccountButton(
      {Key? key,
      required this.title,
      required this.type,
      required this.name,
      required this.emailAddress,
      required this.pin,
      required this.validationKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      onTap: () async {
        //this if statement changes the purpose or the destination of the button
        switch (type.toLowerCase()) {
          case 'signup':
            String completed =await signupObj.signUp(name.text, emailAddress.text, pin.text, validationKey,);
            if (completed == '0') {
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewOTPPage(
                      emailAddress: emailAddress.text, type: 'SignUp')),
            );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => ViewOTPPage(
              //           emailAddress: emailAddress.text, type: 'SignIn')),
              // );
            } else {
              Signuperror(context, completed);
            }

            
            print('reached Sign up!!!!');
            break;

          case 'signin':
            int completed = await signinObj.signIn(
              emailAddress.text,
              pin.text,
              validationKey,
            );
            if (completed == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewOTPPage(
                        emailAddress: emailAddress.text, type: 'SignIn')),
              );
            } else if (completed == 2) {
              loginerror(context);

            }

            print('reached Sign In!!!!');
            break;

          case 'continue':
            await ViewModelIncomeDetails()
                .addIncomeDetails(name.text, emailAddress.text, pin.text);
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavigationBarApp()),
                            );
            print('reached continue!!!!');
            break;

          default:
            print('Eroooorrrrrrrrrrr!!!!');
        }
//buttonAction();
      },
      child: Row(
        children: [
          const SizedBox(
            width: 50,
          ),
          Container(
            width: 250, //323,
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
      ),
    ));
  }
}

@override
Future<void> loginerror(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: 327,
              height: 200,
              decoration: ShapeDecoration(
                color: Color(0xE5383838),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFC05454)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 316,
                    height: 45,
                    child: Text(
                      'فشلت عملية تسجيل الدخول',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFC05454),
                        fontSize: 24,
                        fontFamily: 'Trade Winds',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 316,
                    height: 70,
                    child: Text(
                      'البريد الإلكتروني المدخل أو كلمة المرور خاطئين، أعد كتابتهم.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFC88A8A),
                        fontSize: 20,
                        fontFamily: 'Trade Winds',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Color(0xBF9D4C56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: SizedBox(
                        width: 166,
                        height: 45,
                        child: Text(
                          'موافق',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFF8F8FF),
                            fontSize: 24,
                            fontFamily: 'Trade Winds',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
      });
}
@override
Future<void> Signuperror(BuildContext context, String errorMessage) {
  return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: 327,
              height: 165,
              decoration: ShapeDecoration(
                color: Color(0xE5383838),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFC05454)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 316,
                    height: 45,
                    child: Text(
                      'فشلت عملية التسجيل الجديد',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFC05454),
                        fontSize: 24,
                        fontFamily: 'Trade Winds',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 316,
                    height: 35,
                    child: Text(
                      'حاول مره أخرى لاحقًا',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFC88A8A),
                        fontSize: 20,
                        fontFamily: 'Trade Winds',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Color(0xBF9D4C56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: SizedBox(
                        width: 166,
                        height: 45,
                        child: Text(
                          'موافق',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFF8F8FF),
                            fontSize: 24,
                            fontFamily: 'Trade Winds',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
      });
}