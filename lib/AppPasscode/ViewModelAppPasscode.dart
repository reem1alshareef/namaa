//import 'package:namaagp/OTPPage/hi.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class ViewModelAppPasscode extends BaseViewModel {
   Future<int?> retrievePasscode()async {
     List<dynamic> res = await supabase.from('userAccount')
  .select('passcode')
  .eq('Email', getCurrentUserEmail());
  int hi;
try {
   hi=res[0]['passcode'];
  //hi = double.parse(res[0]['passcode']);
} catch (e) {
  print('Error parsing passcode: $e');
  // Handle the error, provide a default value, or take appropriate action
  return null;
}
return hi;
  }

  void setPasscode(int passcode)async {
     await supabase.from('userAccount').update({'passcode':passcode}).eq('Email', getCurrentUserEmail());
  }
 String? getCurrentUserEmail() {
  final currentUser = supabase.auth.currentUser;
    return currentUser?.email;
  
}

 ViewModelAppPasscode(){}
}