import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:namaagp/AppPasscode/ViewModelAppPasscode.dart';
import 'package:namaagp/Identity%20Elements/introPagesHeader.dart';
import 'package:namaagp/NavigationBar/NavigationBar.dart';
import 'package:stacked/stacked.dart';

class ViewAppPasscodeSetting extends StatelessWidget {
  const ViewAppPasscodeSetting(
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
                           viewmodel.setPasscode(int.parse(passcode));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavigationBarApp()),
                            );
                          
                        }, // end onSubmit
                      ),
                    ],
                  )));
        });
  }
}