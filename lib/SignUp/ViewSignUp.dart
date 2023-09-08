import 'package:flutter/material.dart';
import 'package:namaagp/Components/TextInputField.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:namaagp/SignUp/ViewModelSignUp.dart';
import 'package:stacked/stacked.dart';


class ViewSignUp extends StatelessWidget {
  const ViewSignUp({super.key});

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
                    mainHeader(),
                    //introPagesHeader(subTitle: 'إنشاء حساب',),
                    TextInputField(title: 'الاسم', placeHolder: 'اكتب اسمك'),
                    TextInputField(title: 'رقم الجوال', placeHolder: 'اكتب رقم جوالك'),
                    TextInputField(title: 'كلمة السر', placeHolder: 'اكتب كلمة السر الخاصة بك'),
                    TextInputField(title: 'تأكيد كلمة السر', placeHolder: 'اعد كتابة كلمة السر الخاصة بك'),
                    

                    ElevatedButton(
                          onPressed: () {
                            viewmodel.submitLogin(context);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF4081EC)),
                          child: const Text(
                            'سجل الدخول',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          ),

                    //SizedBox(height: 10,),
                    //AccountButton(title: 'title', placeHolder: 'placeHolder')
                    //header()
                  ],
                )
              ));
        });
  }
}
