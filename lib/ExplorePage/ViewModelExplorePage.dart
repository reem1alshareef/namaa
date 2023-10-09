import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewModelExplorePage extends BaseViewModel {
  Future<String> getCurrency() async {
    String currency='';
    final supabaseClient = SupabaseClient(
      'https://rpwqxndlhdiqkrejigse.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
    );
    String? currentEmail() {
      final String? cemail = AuthenticationService.currentUser?.email;
      //print(cemail);
      return cemail;
    }

    
 final response = await supabase
  .from('balance')
  .select().execute();
      final data = response.data as List<dynamic>;

  for (var item in data) {
      final email = item['emailAddress'] as String;
      if (email == currentEmail()?.toString()) {
        currency = item['mainCurrency'];
      }
    }
    return currency;
  }

  Future<String> getBalance() async {
    String balance='';
    final supabaseClient = SupabaseClient(
      'https://rpwqxndlhdiqkrejigse.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
    );
    String? currentEmail() {
      final String? cemail = AuthenticationService.currentUser?.email;
      //print(cemail);
      return cemail;
    }

    
 final response = await supabase
  .from('balance')
  .select().execute();
      final data = response.data as List<dynamic>;

  for (var item in data) {
      final email = item['emailAddress'] as String;
//print(currentEmail());
print(email == currentEmail()?.toString());
print(currentEmail()?.toString());
      if (email == currentEmail()?.toString()) {
        print('hhii ');
        balance = item['balance'].toString();
      }
    }
    return balance;
  }
}
