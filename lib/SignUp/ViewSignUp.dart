import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/Components/AccountButton.dart';
import 'package:namaagp/Components/CostomizedTextButton.dart';
import 'package:namaagp/Components/TextInputField.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:namaagp/SignUp/ViewModelSignUp.dart';
import 'package:stacked/stacked.dart';


class ViewSignUp extends StatelessWidget {
    final _formKey = GlobalKey<FormState>();

  final TextEditingController namee=TextEditingController();
  final TextEditingController emailAddress=TextEditingController();
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
                child: Form(
                  key: _formKey,
                child: Column(
                  children: [
                    //const SizedBox(height: 5,),
                    const mainHeader(title: 'إنشاء حساب',),
                    const SizedBox(height: 5,),
                    TextInputField(title: 'الاسم', placeHolder: 'اكتب اسمك', inputController: namee,),
                    TextInputField(title: 'البريد الإلكتروني', placeHolder: 'اكتب عنوان بريدك الإلكتروني', inputController: emailAddress,),
                    TextInputField(title: 'كلمة السر', placeHolder: 'اكتب كلمة السر الخاصة بك', inputController: password,),



                    Column(
      children: [
        SizedBox(
          width: 350,
          //height: 25,
          child: Text('تأكيد كلمة السر',
              textAlign: TextAlign.right,
              style: GoogleFonts.getFont("Noto Sans Arabic",
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  textStyle: const TextStyle(color: Color(0xFFC5C5CD)))),
        ),
        SizedBox(
            width: 350,
            //height: 35,//35
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.right,
//keyboardType: title=='الراتب'?TextInputType.number:TextInputType.values,
              decoration: InputDecoration(
                hintText: 'اعد كتابة كلمة السر الخاصة بك',
                hintStyle: const TextStyle(
                    color: Color(0xFF898B99), height: 1, fontSize: 18),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.7, color: Color(0xFFB8BAC2)), //<-- SEE HERE
                ),
                
              ),
              controller: passwordConfirm,
              obscureText:true,
              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى تعبئة الخانة';
              }
              if (value!=password.text) {
                //print(password)
                return 'كلمة السر غير متطابقة';
              }
              return null;
            }
            )),
        const SizedBox(
          height: 10,
        )
      ],
    ),




                    //TextInputField(title: 'تأكيد كلمة السر', placeHolder: 'اعد كتابة كلمة السر الخاصة بك', inputController: passwordConfirm,),
                    AccountButton(title: 'أكمل', type: 'SignUp', name: namee, emailAddress: emailAddress, pin: password, validationKey: _formKey,),
                    const SizedBox(height: 5,),
                    CostomizedTextButton(question: 'مستخدم سابق؟  ', actionTitle: 'سجل الدخول', purpose: 'SignIn',)
                    // mainHeader(),
                    // //introPagesHeader(subTitle: 'إنشاء حساب',),
                    // TextInputField(title: 'الاسم', placeHolder: 'اكتب اسمك'),
                    // TextInputField(title: 'رقم الجوال', placeHolder: 'اكتب رقم جوالك'),
                    // TextInputField(title: 'كلمة السر', placeHolder: 'اكتب كلمة السر الخاصة بك'),
                    // TextInputField(title: 'تأكيد كلمة السر', placeHolder: 'اعد كتابة كلمة السر الخاصة بك'),
                    

                    // ElevatedButton(
                    //       onPressed: () async {
                    //         AuthenticationService authService = AuthenticationService();
                    //         await authService.signUp(
                    //           name: 'ree',
                    //           password: '456',
                    //           phoneNumber: '34567',
                    //           passcode: 'bj',
                    //           );
                              
                    //         print('reem');
                    //       },
                    //       style: ElevatedButton.styleFrom(
                    //           primary: const Color(0xFF4081EC)),
                    //       child: const Text(
                    //         'سجل الدخول',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w700,
                    //           fontSize: 18,
                    //         ),
                    //       ),
                    //       ),

                    //SizedBox(height: 10,),
                    //AccountButton(title: 'title', placeHolder: 'placeHolder')
                    //header()
                  ],
                ))
              ));
        });
  }
}
