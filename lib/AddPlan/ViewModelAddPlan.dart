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

Future<List<Map<String, dynamic>>> fetchData() async {
  final response = await supabaseClient.from('savingPlan').select();

  if (response.error == null) {
    return List<Map<String, dynamic>>.from(response.data);
  } else {
    // Handle the error, maybe throw an exception
    throw response.error!;
  }
}

class ViewModelAddPlan extends BaseViewModel {
  Future<void> addPlan(
    String startdate,
    String enddate,
    String goal,
    String goalName,
  ) async {
    await supabaseClient.from('savingPlan').insert({
      'startDate': startdate,
      'endDate': enddate,
      'goal': goal,
      'goalName': goalName
       ,'emailAddress' : currentEmail()?.toString() 
    });
  }

  Future<void> deletePlan() async {
    await supabaseClient.from('savingPlan').delete()
    .match({ 'emailAddress' : currentEmail()?.toString()  });
  }
}
