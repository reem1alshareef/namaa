import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class ViewModelupdateSupabasePassword extends BaseViewModel {
  resetPass(String email) async {
    try {
      // Assuming you're using Supabase authentication
      await supabase.auth.resetPasswordForEmail(email);
      
      print('Password reset successful');
    } catch (error) {
      // Handle errors or log them as needed
      print('Error resetting password: $error');
    }
  }
}

