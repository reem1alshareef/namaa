import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:namaagp/Components/CostomizedTextButton.dart';
import 'package:namaagp/Components/ReturnToPreviousPage.dart';
import 'package:namaagp/Identity%20Elements/introPagesHeader.dart';
import 'package:namaagp/OTPPage/ViewModelOTPPage.dart';
import 'package:stacked/stacked.dart';


class ViewOTPPage extends StatelessWidget {
  const ViewOTPPage({super.key});
  
  get otpController => null;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelOTPPage>.reactive(
        viewModelBuilder: () => ViewModelOTPPage(),
        builder: (context, viewmodel, _) {
          return Scaffold(
              backgroundColor: const Color(0x00071121),
              body: Container(
                padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                width: 428,
                height: 926,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  //maybe delete const
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
                    ReturnToPreviousPage(title: 'الصفحة السابقة'),
                    //ReturnToPreviousPage(),
                    //mainHeader(),
                    introPagesHeader(subTitle: 'تم إرسال رمز التحقق على رقم جوالك', title: 'أدخل رمز التحقق',),
            //         OTPTextField(
            //           //wi,
            //           otpFieldStyle: OtpFieldStyle(borderColor: Color(0xE5D0CDEF), ),
            //           //borderColor: Color(0xFF512DA8),
            // controller: otpController,
            // length: 4,
            // width: MediaQuery.of(context).size.width,
            // textFieldAlignment: MainAxisAlignment.spaceAround,
            // fieldWidth: 45,
            // fieldStyle: FieldStyle.box,
            // outlineBorderRadius: 0,
            // style: TextStyle(fontSize: 17),
            // onChanged: (pin) {
            //   print("Changed: " + pin);
            // },
            // onCompleted: (pin) {
            //   print("Completed: " + pin);
            // }),
                    OtpTextField(
                      margin: EdgeInsets.all(12),
                      //textFieldAlignment: MainAxisAlignment.spaceAround,
        numberOfFields: 4,
        borderColor: Color(0x0C16325F),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true, 
        fieldWidth: 65,
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderWidth: 1,
        textStyle: TextStyle(fontSize: 26, color: Color.fromARGB(255, 255, 255, 255)),
        
        //runs when a code is typed in
        // onCodeChanged: (String code) {
        //     //handle validation or checks here           
        // },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
          viewmodel.returnOTP(verificationCode);
          //Navigator.pop(context, verificationCode);
            //returnCode(verificationCode);
        }, // end onSubmit
    ),
    CostomizedTextButton(question: 'لم يصلك رمز التحقق؟  ', actionTitle: 'إعادة إرسال', purpose: 'ResendOTP',)

    //TextButton(onPressed: onPressed, child: child)
    // Container(
    //   child: ResendOTP(),
    //   alignment: Alignment.center,
    //   //alignment:
    // )
    


                  ],
                )
              ));
        });
  }

  
}

// String returnCode(String verificationCode) {
//   Navigator.pop(context as BuildContext);  
//    //return verificationCode; 
// }