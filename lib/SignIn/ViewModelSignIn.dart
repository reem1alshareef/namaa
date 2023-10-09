import 'package:flutter/material.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class ViewModelSignIn extends BaseViewModel {
    //final formKey = GlobalKey<FormState>();

  bool signIn(String emailAddress, String password, GlobalKey<FormState> validationKey){
    print('آخف reached');
    //print(phonenumber);
    print(validationKey.currentState!.validate().toString());
    if(validationKey.currentState!.validate()){
      print('آخف emptyyyy');
      AuthenticationService.signInUser(emailAddress, password);
      return true;
      
    } else {
      print('emptyyyy');
      return false;
    }
    

  }
}