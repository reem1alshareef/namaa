import 'package:flutter/material.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

// class ViewModelSignUp extends BaseViewModel {
//   final authService = locator<AuthenticationService>();
  
//   final supabase = Supabase.instance.client;

//   // Form data
//   String? name;
//   String? phoneNumber;
//   String? password;
//   String? passcode;

//   final formKey = GlobalKey<FormState>();


// submitsign(BuildContext context) async {
// await supabase.from('userAccount').insert([
//   {'name': 'The Shire', 'country_id': 554},
//   {'name': 'Rohan', 'country_id': 555},
// ]);
//     print('reem');

//     formKey.currentState?.save();

//     try {
//       await authService.signUp(
//         name: name!,
//         phoneNumber: phoneNumber!,
//         password: password!,
//         passcode: passcode!,
//       );
//       // Sign up successful, navigate to the next screen
//       // TODO: Add your navigation logic here
//     } catch (e) {
//       // Sign up failed, show error message
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(
//               'حدث خطأ أثناء إنشاء الحساب',
//               textAlign: TextAlign.center,
//             ),
//           );
//         },
//       );
//     }
//   }
  // signUp(String name, String phonenumber, String password){
  //   //print(name);
  //   sub
  // }
  //}


class ViewModelSignUp extends BaseViewModel {
  Future<int> signUp(String namee, String email, String password, GlobalKey<FormState> validationKey) async {
    // AuthenticationService().signUp( namee: namee, emaill: email, passwordd: password, );
    if(validationKey.currentState!.validate()){
      //print('آخف emptyyyy');
      try{
              int response=await AuthenticationService().signUp( namee: namee, emaill: email, passwordd: password, );
              if(response==2)return 2;
      return 0;

      }on Exception catch(e){
        //showDialog(context: context, builder: builder)
        return 2;
      }
      //return 1;
      
    } else {
      //print('emptyyyy');
      return 1;
    }

    //print(name);
  }
}
