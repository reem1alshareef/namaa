import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:namaagp/AppPasscode/ViewModelAppPasscode.dart';
import 'package:namaagp/Components/CostomizedTextButton.dart';
import 'package:namaagp/Identity%20Elements/introPagesHeader.dart';
import 'package:namaagp/NavigationBar/NavigationBar.dart';
import 'package:stacked/stacked.dart';

class ViewAppPasscode extends StatelessWidget {
  const ViewAppPasscode(
      {super.key, });
  //final email = emailAddress;

  get otpController => null;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelAppPasscode>.reactive(
        viewModelBuilder: () => ViewModelAppPasscode(),
        builder: (context, viewmodel, _) {
          return Scaffold(
              backgroundColor: const Color(0x00071121),
              body: Container(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                  width: 428,
                  height: 926,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-0.00, -6.00),
                      end: Alignment(0, 1.5),
                      colors: [
                        Color(0xFF342D68),
                        Color(0xFF352D68),
                        Color(0x00352D68)
                      ],
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  child: Column(
                    children: [
                      // const ReturnToPreviousPage(
                      //   title: 'الصفحة السابقة',
                      //   tWidth: 700,
                      // ),
                      const introPagesHeader(
                        subTitle: '',
                        title: 'أدخل رمز الدخول',
                      ),
                      OtpTextField(
                        margin: const EdgeInsets.all(5),
                        numberOfFields: 4,
                        borderColor: const Color(0x0C16325F),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        fieldWidth: 45,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(0)),
                        borderWidth: 1,
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),

                        //runs when a code is typed in
                        // onCodeChanged: (String code) {
                        //     //handle validation or checks here
                        // },
                        //runs when every textfield is filled
                        onSubmit: (
                          String passcode
                        ) async {
                          int? passcodeValue = await viewmodel.retrievePasscode();
                          if (passcodeValue== int.parse(passcode)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavigationBarApp()),
                            );
                          }else{
                            passcodeWrong(context);
                          }
                        }, // end onSubmit
                      ),
                      CostomizedTextButton(
                        question: 'نسيت رمز الدخول؟  ',
                        actionTitle: 'سجل دخول محددًا',
                        purpose: 'ResendOTP',
                      )
                    ],
                  )));
        });
  }
}

Future<void> passcodeWrong(BuildContext context) {
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
                      'فشلت عملية الدخول',
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
                      'الرمز المدخل غير صحيح، أعد كتابته أو أعد تسجيل الدخول.',
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