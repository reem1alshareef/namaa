//import 'package:namaagp/OTPPage/hi.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewModelAppPasscode extends BaseViewModel {
  Future<PostgrestResponse> retrievePasscode()async {
     PostgrestResponse res = await supabase
  .from('userAccount')
  .select('passcode')
  .eq('Email', currentEmail())
  .execute();

return res;
  }
String? currentEmail() {
  final String? cemail = AuthenticationService.currentUser?.email;
  return cemail;
}

 ViewModelAppPasscode(){}
}