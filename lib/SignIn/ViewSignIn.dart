import 'package:flutter/material.dart';
import 'package:namaagp/SignIn/ViewModelSignIn.dart';
import 'package:stacked/stacked.dart';


class ViewSignIn extends StatelessWidget {
  const ViewSignIn({super.key});
  
  get otpController => null;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelSignIn>.reactive(
        viewModelBuilder: () => ViewModelSignIn(),
        builder: (context, viewmodel, _) {
          return Scaffold(

          );
        });
  }

  
}