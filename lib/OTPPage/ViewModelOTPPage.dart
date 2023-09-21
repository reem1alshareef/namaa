//import 'package:namaagp/OTPPage/hi.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class ViewModelOTPPage extends BaseViewModel {
  //final hhh= hi();
  Future<void> returnOTP(String verificationCode, String emailAddress)async {
     AuthenticationService.verifyUserAccount(verificationCode, emailAddress);
    //hhh.hiiii(verificationCode);
  }

  Resend_OTP(){
    print('reached resend!');
  }
}