import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';


final supabaseClient = SupabaseClient(
    'https://rpwqxndlhdiqkrejigse.supabase.co',
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");

String? currentEmail() {
      final String? cemail = AuthenticationService.currentUser?.email;
      return cemail;
    }

class ViewModelAddExpenses extends BaseViewModel {
  Future<void> addExpenses(String date, String chosenCurrency, String categoryName, String expense,)
  async {
await supabaseClient
    .from('expenses')
    .insert({'category': categoryName, 'date': date , 'price' : expense , 'currency' : chosenCurrency ,'emailAddress' : currentEmail()?.toString() });
    
  
  }
}
