import 'package:flutter/material.dart';
import 'package:namaagp/Components/TextInputField.dart';
import 'package:namaagp/Components/resetButton.dart';
import 'package:namaagp/Identity Elements/mainHeader.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'package:namaagp/updatePassword/ViewModelupdateSupabasePassword.dart';
import 'package:namaagp/updatePassword/resetDataPage.dart';
import 'package:stacked/stacked.dart';

class ViewupdateSupabasePassword extends StatefulWidget {
  ViewupdateSupabasePassword({Key? key}) : super(key: key);

  @override
  _ViewupdateSupabasePasswordState createState() =>
      _ViewupdateSupabasePasswordState();
}

class _ViewupdateSupabasePasswordState
    extends State<ViewupdateSupabasePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  String resetTokenValue = '';

  @override
  void initState() {
    super.initState();
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
                    title: 'إستعادة كلمة السر',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                    title: 'البريد الالكتروني',
                    placeHolder: 'اكتب عنوان بريدك الإلكتروني',
                    inputController: emailAddress,
                  ),
                  ResetButton(
                    title: 'إرسال الرمز',
                    type: 'reset',
                    name: newPassword,
                    emailAddress: emailAddress,
                    onPressed: () async {
  if (_formKey.currentState!.validate()) {
    final resttoken = supabase.auth.resetPasswordForEmail(emailAddress.text);
    //.then((_) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(''),
            content: Text('تم إرسال رمز إعادة تعيين كلمة السر'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => resetDataPage(
                        emailAddress: emailAddress.text,
                        otp: resetTokenValue,
                      ),
                    ),
                  );
                },
                child: Text('موافق'),
              ),
            ],
          );
        },
      );
    //}
    //);
  }
},),
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
}