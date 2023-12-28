import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
class ViewModelAddPlan extends BaseViewModel {
final supabaseClient = SupabaseClient(
    'https://rpwqxndlhdiqkrejigse.supabase.co',
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");
String? getCurrentUserEmail() {
  final currentUser = supabase.auth.currentUser;
    return currentUser?.email;
  
}

static Future<List<dynamic>> fetchData() async {
final supabaseClient = SupabaseClient(
    'https://rpwqxndlhdiqkrejigse.supabase.co',
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");
String? getCurrentUserEmail() {
  final currentUser = supabase.auth.currentUser;
    return currentUser?.email;
  
}

  final response = await supabaseClient
      .from('savingPlan')
      .select()
      .eq('emailAddress', getCurrentUserEmail())
      .execute();

  return (response.data as List<dynamic>);
}


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
      'goalName': goalName,
      'emailAddress': getCurrentUserEmail()
    });
  }

  Future<void> deletePlan(String goalName) async {
    await supabaseClient
        .from('savingPlan')
        .delete()
        .match({'goalName': goalName});
  }
}
