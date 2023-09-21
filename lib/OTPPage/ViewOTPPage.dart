import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:namaagp/Components/CostomizedTextButton.dart';
import 'package:namaagp/Components/ReturnToPreviousPage.dart';
import 'package:namaagp/Identity%20Elements/introPagesHeader.dart';
import 'package:namaagp/IncomeDetails/ViewIncomeDetails.dart';
import 'package:namaagp/OTPPage/ViewModelOTPPage.dart';
import 'package:stacked/stacked.dart';


class ViewOTPPage extends StatelessWidget {
  final String emailAddress;
  const ViewOTPPage({super.key, required this.emailAddress});
  //final email = emailAddress;
  
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
                    const ReturnToPreviousPage(title: 'الصفحة السابقة', tWidth: 400,),
                    const introPagesHeader(subTitle: 'تم إرسال رمز التحقق على بريدك الإلكتروني', title: 'أدخل رمز التحقق',),
                    OtpTextField(
                      margin: const EdgeInsets.all(8),
        numberOfFields: 6,
        borderColor: const Color(0x0C16325F),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true, 
        fieldWidth: 45,
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        borderWidth: 1,
        textStyle: const TextStyle(fontSize: 26, color: Color.fromARGB(255, 255, 255, 255)),
        
        //runs when a code is typed in
        // onCodeChanged: (String code) {
        //     //handle validation or checks here           
        // },
        //runs when every textfield is filled
        onSubmit: (String verificationCode,) async {
          //var emailAddress=e;
          await viewmodel.returnOTP(verificationCode, emailAddress);
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  ViewIncomeDetails()),
  );
            //Navigator.pop(context, (route) =>ViewIncomeDetails());
          
          //Navigator.pop(context, verificationCode);
            //returnCode(verificationCode);
        }, // end onSubmit
    ),
    CostomizedTextButton(question: 'لم يصلك رمز التحقق؟  ', actionTitle: 'إعادة إرسال', purpose: 'ResendOTP',)
    


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



// ElevatedButton(onPressed: () async {
                      
//                       await Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const ViewOTPPage()),
//   );
//   print(hhh);}
//                     , child: null,),
//                     Text('hhh', style: TextStyle(fontSize: 20, color: Colors.white),),
//                     Column(children: [if(hhh!='')...[
// Text(hhh, style: TextStyle(fontSize: 20, color: Colors.white),)
//                     ]else...[
// Text(hhh, style: TextStyle(fontSize: 20, color: Colors.white),)
//                     ]],)