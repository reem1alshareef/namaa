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
  signUp(String namee, String email, String password){
    AuthenticationService().signUp( namee: namee, emaill: email, passwordd: password, );

    //print(name);
  }
}
