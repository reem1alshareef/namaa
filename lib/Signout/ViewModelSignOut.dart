import 'package:stacked/stacked.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewModelSignOut extends BaseViewModel {
  final supabaseClient = SupabaseClient(
    'https://rpwqxndlhdiqkrejigse.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
  );

  Future<void> SignOut() async {
    
    await supabaseClient.auth.signOut();
    // supabaseClient.auth.currentSession == null;
    
   
    print('signed out');
  }
}
