import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class ViewModelSignIn extends BaseViewModel {
  signIn(String emailAddress, String password){
    //print(phonenumber);
    AuthenticationService.signInUser(emailAddress, password);
  }
}