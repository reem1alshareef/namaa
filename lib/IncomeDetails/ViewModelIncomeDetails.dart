//import 'package:namaagp/OTPPage/hi.dart';
import 'dart:async';

import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//import 'package:postgres/postgres.dart';

final supabaseClient = SupabaseClient('https://rpwqxndlhdiqkrejigse.supabase.co', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");
class ViewModelIncomeDetails extends BaseViewModel {
  
  
  //final hhh= hi();
  Future<void> addIncomeDetails(String salaryDate, String salary ,String currency,) async {

  var salaryAmountAsInt = int.tryParse(salary);
  var salaryDateAsInt = int.tryParse(salaryDate);
  
  switch(currency){
    case 'درهم إماراتي' :
    await supabaseClient.from('balance').insert([{ 'emailAddress' : getCurrentUserEmail(), 'UAE': salaryAmountAsInt, 'mainCurrency': currency  , 'salary' :salaryAmountAsInt!*1.02 ,'salary_date': salaryDateAsInt },]);
    break;
    case 'ريال سعودي' :
    await supabaseClient.from('balance').insert([{ 'emailAddress' : getCurrentUserEmail(), 'SAR': salaryAmountAsInt, 'mainCurrency': currency  , 'salary' :salaryAmountAsInt ,'salary_date': salaryDateAsInt },]);
    break;
    case 'يورو' :
    await supabaseClient.from('balance').insert([{ 'emailAddress' : getCurrentUserEmail(), 'EUR': salaryAmountAsInt, 'mainCurrency': currency  , 'salary' :salaryAmountAsInt!*4 ,'salary_date': salaryDateAsInt },]);
    break;
    case 'دولار أمريكي' :
    await supabaseClient.from('balance').insert([{ 'emailAddress' : getCurrentUserEmail(), 'US': salaryAmountAsInt, 'mainCurrency': currency  , 'salary' :salaryAmountAsInt!*3.75 ,'salary_date': salaryDateAsInt },]);
    //ViewModelIncomeDetails().startPeriodicUpdate();
    break;
    case 'جنيه إسترليني' :
    await supabaseClient.from('balance').insert([{ 'emailAddress' : getCurrentUserEmail(), 'GBP': salaryAmountAsInt, 'mainCurrency': currency  , 'salary' :salaryAmountAsInt!*4.59 ,'salary_date': salaryDateAsInt },]);
    break;
  }
}
  String? getCurrentUserEmail() {
  final currentUser = supabase.auth.currentUser;
    return currentUser?.email;
  
}

}




