import 'package:flutter/material.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class ViewModelSignUp extends BaseViewModel {
   Future<String> signUp(String namee, String email, String password, GlobalKey<FormState> validationKey) async {
    if(validationKey.currentState!.validate()){
      try{
              int response=await AuthenticationService().signUp( namee: namee, emaill: email, passwordd: password, );
              if(response==2)return '2';
      return '0';

      }on Exception catch(e){
       return '2';
      }
      
    } else {
      return '1';
    }
  }
}


 //print(e.toString());
        //return e.toString();

// //