import 'package:flutter/material.dart';
import 'package:namaagp/Components/AccountButton.dart';
import 'package:namaagp/Components/CostomizedTextButton.dart';
import 'package:namaagp/Components/TextInputField.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:namaagp/SignIn/ViewModelSignIn.dart';
import 'package:stacked/stacked.dart';


class ViewSignIn extends StatelessWidget {
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namee=TextEditingController();
  static final  TextEditingController emailAddress=TextEditingController();
  
  final TextEditingController password=TextEditingController();
  //final TextEditingController passwordConfirm=TextEditingController();
  ViewSignIn({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelSignIn>.reactive(
        viewModelBuilder: () => ViewModelSignIn(),
        builder: (context, viewmodel, _) {
          return Scaffold(
             resizeToAvoidBottomInset: false, 
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
                  key: _formKey,//viewmodel.formKey,
                  // child: Column(
                  //   children: [
                  //     const SizedBox(height: 20,),
                  //     //ReturnToPreviousPage(title: 'التسجيل', tWidth: 400),
                  //     //introPagesHeader(title: 'تسجيل الدخول', subTitle: ''),
                  //     const mainHeader(title: 'تسجيل الدخول',),
                  //     const SizedBox(height: 20,),
                  //     TextInputField(title: 'رقم الجوال', placeHolder: 'اكتب رقم جوالك', inputController: emailAddress,),
                  //     TextInputField(title: 'كلمة السر', placeHolder: 'اكتب كلمة السر الخاصة بك', inputController: password,),
                  //     AccountButton(title: 'سجل الدخول', type: 'SignIn', name: namee, emailAddress: emailAddress, pin: password, validationKey:_formKey),
                  //     const SizedBox(height: 5,),
                  //     CostomizedTextButton(question: 'نسيت كلمة المرور؟  ', actionTitle: 'إستعادة كلمة المرور', purpose: 'SignUp', )//validationKey:_formKey)
                  //   ],
                  // ),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    //ReturnToPreviousPage(title: 'التسجيل', tWidth: 400),
                    //introPagesHeader(title: 'تسجيل الدخول', subTitle: ''),
                    const mainHeader(title: 'تسجيل الدخول',),
                    const SizedBox(height: 20,),
                    TextInputField(title: 'البريد الإلكتروني', placeHolder: 'اكتب عنوان بريدك الإلكتروني', inputController: emailAddress,),
                    
                    //TextInputField(title: 'رقم الجوال', placeHolder: 'اكتب رقم جوالك', inputController: emailAddress,),
                    TextInputField(title: 'كلمة السر', placeHolder: 'اكتب كلمة السر الخاصة بك', inputController: password,),
                    AccountButton(title: 'سجل الدخول', type: 'SignIn', name: namee, emailAddress: emailAddress, pin: password,validationKey:_formKey),
                    const SizedBox(height: 5,),
                    CostomizedTextButton(question: 'نسيت كلمة المرور؟  ', actionTitle: 'إستعادة كلمة المرور', purpose: 'retrievePassword',)
                  ],
                )
              )));
        });
        
  }

//   static Future<void> showMyDialog(BuildContext context) async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('AlertDialog Title'),
//         content: const SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text('This is a demo alert dialog.'),
//               Text('Would you like to approve of this message?'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Approve'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
//   Widget invalidLoginData(){
    
// return AlertDialog(
//               title: Text("فشلت عملية تسجيل الدخول"),
//               content: Container(
//     width: 387,
//     height: 236,
//     decoration: ShapeDecoration(
//         color: Color(0xE5383838),
//         shape: RoundedRectangleBorder(
//             side: BorderSide(width: 1, color: Color(0xFFC05454)),
//             borderRadius: BorderRadius.circular(20),
//         ),
//     ),
// ),//Text(".البريد الإلكتروني المدخل أو كلمة المرور خاطئين، أعد كتابتهم"),
//               actions: [
//                 ElevatedButton(
//                   child: Text("jjkjk"),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 )
//               ],
//             );              
//   }
}


// class invalidLogin extends StatelessWidget {
//   // final String title;
//   // final String placeHolder;
//   // final TextEditingController inputController;

//   const invalidLogin({
//     Key? key,
//     // required this.title,
//     // required this.placeHolder,
//     // required this.inputController,
//   }) : super(key: key);

  @override
  Future<void> loginerror(BuildContext context) {
    return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }
  );
  }
