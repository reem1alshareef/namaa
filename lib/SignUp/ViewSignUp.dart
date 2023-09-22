import 'package:flutter/material.dart';
import 'package:namaagp/Components/AccountButton.dart';
import 'package:namaagp/Components/CostomizedTextButton.dart';
import 'package:namaagp/Components/TextInputField.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:namaagp/SignUp/ViewModelSignUp.dart';
import 'package:stacked/stacked.dart';


class ViewSignUp extends StatelessWidget {
  final TextEditingController namee=TextEditingController();
  final TextEditingController phonenumberr=TextEditingController();
  final TextEditingController password=TextEditingController();
  final TextEditingController passwordConfirm=TextEditingController();
   ViewSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelSignUp>.reactive(
        viewModelBuilder: () => ViewModelSignUp(),
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
                    SizedBox(height: 5,),
                    mainHeader(title: 'إنشاء حساب',),
                    SizedBox(height: 5,),
                    TextInputField(title: 'الاسم', placeHolder: 'اكتب اسمك', inputController: namee,),
                    TextInputField(title: 'رقم الجوال', placeHolder: 'اكتب رقم جوالك', inputController: phonenumberr,),
                    TextInputField(title: 'كلمة السر', placeHolder: 'اكتب كلمة السر الخاصة بك', inputController: password,),
                    TextInputField(title: 'تأكيد كلمة السر', placeHolder: 'اعد كتابة كلمة السر الخاصة بك', inputController: passwordConfirm,),
                    AccountButton(title: 'أكمل', type: 'SignUp', name: namee, phonenumber: phonenumberr, pin: password,),
                    SizedBox(height: 5,),
                    CostomizedTextButton(question: 'مستخدم سابق؟  ', actionTitle: 'سجل الدخول', purpose: 'SignIn',)
                  ],
                )
              ));
        });
  }
}