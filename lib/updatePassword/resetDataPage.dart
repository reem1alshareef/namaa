import 'package:flutter/material.dart';
import 'package:namaagp/Components/TextInputField.dart';
import 'package:namaagp/Components/resetButton.dart';
import 'package:namaagp/Identity Elements/mainHeader.dart';
import 'package:namaagp/SignIn/ViewSignIn.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'package:namaagp/updatePassword/ViewModelupdateSupabasePassword.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:stacked/stacked.dart';

class resetDataPage extends StatefulWidget {
  final String emailAddress;
  final String otp;
  resetDataPage({Key? key, required this.emailAddress , required this.otp}) : super(key: key);

  @override
  _resetDataPageState createState() => _resetDataPageState();

}

class _resetDataPageState extends State<resetDataPage> {
  
  final GlobalKey<_resetDataPageState> resetDataPageKey = GlobalKey<_resetDataPageState>();
  String validationMessage = '';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController newpassword = TextEditingController();
  final TextEditingController resetToken = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController reset = TextEditingController ();


  @override
  void initState() {
    super.initState();
    // Assign the email address to the controller
    emailAddressController.text = widget.emailAddress;
    
    

    
    
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelupdateSupabasePassword>.reactive(
      viewModelBuilder: () => ViewModelupdateSupabasePassword(),
      builder: (context, viewmodel, _) {
        
        return Scaffold(
          
          backgroundColor: const Color(0x00071121),
          body: Container(
            padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const mainHeader(
                    title: 'إعادة تعيين كلمة السر',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                    title: 'كلمة السر الجديدة',
                    placeHolder: 'أدخل كلمة السر الجديدة الخاصة بك',
                    inputController: newpassword,
                    
                  ),
                  TextInputField(
                    title: 'رمز إعادة التعيين',
                    placeHolder:
                        'أدخل رمز إعادة التعيين المرسل إلى البريد الإلكتروني',
                    inputController: resetToken,
                  ),

                  ResetButton(
                    title: 'تأكيد',
                    type: 'reset',
                    name: reset, // Use the password controller or any other controller as needed
                    emailAddress: emailAddressController,
                    onPressed: () async {
  if (_formKey.currentState!.validate() && resetToken.text.isNotEmpty) {
    try{
    //if (resetToken.text == wotp.text) {
      print('valid OTP');
        final recovery = await supabase.auth.verifyOTP(
          email: emailAddressController.text,
          token: resetToken.text,
          type: OtpType.recovery,
        );
        print(recovery);
        
        await supabase.auth.updateUser(
          UserAttributes(password: newpassword.text),
        );
        print('update');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ViewSignIn()),
        );
        // Show success message or navigate to the login page

    }catch(error) {
      
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('فشل في إعادة تعيين كلمة السر'),
            content: Text('رمز التحقق غير صحيح'),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  resetToken.clear();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => resetDataPage(
                  //       emailAddress: emailAddressController.text,
                  //       otp: resetToken.text,
                  //     ),
                  //   ),
                  // );
                },
                child: Text('إعادة الإدخال'),
              ),
            ],
          );
        },
      );
    }
  }
},
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  
                ],
              ),
            ),
          ),
          
        );
      },
    );
  }

// String validateResetToken() {
//   if (resetToken.text.isEmpty) {
//     return 'يرجى إدخال رمز إعادة التعيين';
//   }
//   if (resetToken.text != widget.otp) {
//     return 'خطأ في رمز إعادة التعيين';
    
//   }
//   print("done");
//   return' ';
  
// }

  //   String  validateResetToken() {
  // //   if (value.isEmpty) {
  // //     return false;
  // //   }
  // //   if (value != otp) {
  // //     // Show an error message or take appropriate action
  // //     print('error otp');
  // //     return false;
  // //   }
  // //   // Add additional validation logic if needed
  // //   return true;
  }



