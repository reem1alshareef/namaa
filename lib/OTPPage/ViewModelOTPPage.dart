//import 'package:namaagp/OTPPage/hi.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewModelOTPPage extends BaseViewModel {
  //final hhh= hi();
  Future<void> returnOTP(String verificationCode, String emailAddress)async {
    AuthenticationService.verifyUserAccount(verificationCode, emailAddress);
    //hhh.hiiii(verificationCode);
  }
String? currentEmail() {
  final String? cemail = AuthenticationService.currentUser?.email;
  return cemail;
}
Future<void> resendOTP() async {
  // print('before resend');
  // print(currentEmail());
  // await supabase.auth.resend(
  //   type: OtpType.signup,
  //   email: currentEmail(), 
  // );
  // print(currentEmail());
  // print('inside resend');
  await supabase.auth.signInWithOtp(
  email: currentEmail(),
);
}
}