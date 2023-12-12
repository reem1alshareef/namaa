import 'package:flutter/material.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class ViewModelSignIn extends BaseViewModel {
    //final formKey = GlobalKey<FormState>();

  Future<int> signIn(String emailAddress, String password, GlobalKey<FormState> validationKey) async {
    //print('آخف reached');
    //print(phonenumber);
    //print(validationKey.currentState!.validate().toString());
    if(validationKey.currentState!.validate()){
      //print('آخف emptyyyy');
      try{
              int response=await AuthenticationService.signInUser(emailAddress, password,);
              if(response==2)return 2;
      return 0;

      }on Exception catch(e){
        //showDialog(context: context, builder: builder)
        return 2;
      }
      return 1;
      
    } else {
      //print('emptyyyy');
      return 1;
    }
    

  }
}


