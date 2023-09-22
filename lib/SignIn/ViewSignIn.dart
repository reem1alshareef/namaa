import 'package:flutter/material.dart';
import 'package:namaagp/Components/AccountButton.dart';
import 'package:namaagp/Components/CostomizedTextButton.dart';
import 'package:namaagp/Components/TextInputField.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:namaagp/SignIn/ViewModelSignIn.dart';
import 'package:stacked/stacked.dart';


class ViewSignIn extends StatelessWidget {
  final TextEditingController namee=TextEditingController();
  final TextEditingController phonenumberr=TextEditingController();
  final TextEditingController password=TextEditingController();
  //final TextEditingController passwordConfirm=TextEditingController();
   ViewSignIn({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelSignIn>.reactive(
        viewModelBuilder: () => ViewModelSignIn(),
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
                    SizedBox(height: 20,),
                    //ReturnToPreviousPage(title: 'التسجيل', tWidth: 400),
                    //introPagesHeader(title: 'تسجيل الدخول', subTitle: ''),
                    mainHeader(title: 'تسجيل الدخول',),
                    SizedBox(height: 20,),
                    TextInputField(title: 'رقم الجوال', placeHolder: 'اكتب رقم جوالك', inputController: phonenumberr,),
                    TextInputField(title: 'كلمة السر', placeHolder: 'اكتب كلمة السر الخاصة بك', inputController: password,),
                    AccountButton(title: 'سجل الدخول', type: 'SignIn', name: namee, phonenumber: phonenumberr, pin: password,),
                    SizedBox(height: 5,),
                    CostomizedTextButton(question: 'نسيت كلمة المرور؟  ', actionTitle: 'إستعادة كلمة المرور', purpose: 'SignUp',)
                  ],
                )
              ));
        });
  }
}