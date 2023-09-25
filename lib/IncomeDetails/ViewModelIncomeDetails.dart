//import 'package:namaagp/OTPPage/hi.dart';
import 'dart:async';

import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//import 'package:postgres/postgres.dart';


class ViewModelIncomeDetails extends BaseViewModel {
  
  
  //final hhh= hi();
  Future<void> addIncomeDetails(String salaryDate, String salary ,String currency,) async {

  var salaryAmountAsInt = int.tryParse(salary);
  var salaryDateAsInt = int.tryParse(salaryDate);

final supabaseClient = SupabaseClient('https://rpwqxndlhdiqkrejigse.supabase.co', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");
  // await supabaseClient.from('balance')
  // .insert([
  //   { 'emailAddress' : getCurrentUserEmail(), 'mainCurrency': currency  , 'salary' :salaryAmountAsInt ,'salaryDate': salaryDateAsInt },
  // ]);
  
  switch(currency){
    case 'درهم إماراتي' :
    updateBalance();
    await supabaseClient.from('balance').insert([{ 'emailAddress' : getCurrentUserEmail(), 'UAE': salaryAmountAsInt, 'mainCurrency': currency  , 'salary' :salaryAmountAsInt!*1.02 ,'salaryDate': salaryDateAsInt },]);
    break;
    case 'ريال سعودي' :
    await supabaseClient.from('balance').insert([{ 'emailAddress' : getCurrentUserEmail(), 'SAR': salaryAmountAsInt, 'mainCurrency': currency  , 'salary' :salaryAmountAsInt ,'salaryDate': salaryDateAsInt },]);
    break;
    case 'يورو' :
    await supabaseClient.from('balance').insert([{ 'emailAddress' : getCurrentUserEmail(), 'EUR': salaryAmountAsInt, 'mainCurrency': currency  , 'salary' :salaryAmountAsInt!*4 ,'salaryDate': salaryDateAsInt },]);
    break;
    case 'دولار أمريكي' :
    await supabaseClient.from('balance').insert([{ 'emailAddress' : getCurrentUserEmail(), 'US': salaryAmountAsInt, 'mainCurrency': currency  , 'salary' :salaryAmountAsInt!*3.75 ,'salaryDate': salaryDateAsInt },]);
    break;
    case 'جنيه إسترليني' :
    await supabaseClient.from('balance').insert([{ 'emailAddress' : getCurrentUserEmail(), 'GBP': salaryAmountAsInt, 'mainCurrency': currency  , 'salary' :salaryAmountAsInt!*4.59 ,'salaryDate': salaryDateAsInt },]);
    break;
  }
  }
  getCurrentUserEmail() {
  final currentUser = supabase.auth.currentUser;
  if (currentUser != null) {
    return currentUser.email;
  }
}

salaryDate() async {
  var salaryDate = await supabaseClient.from('balance').select('salaryDate');
  return salaryDate as int;
}

static updateBalance() async {

    var balance = int.tryParse( await supabaseClient.from('balance').select('balance'));
    var salary = int.tryParse(await supabaseClient.from('balance').select('salary'));
      int balanceAsint = 100 + salary! ;
    final currentUser = supabase.auth.currentUser;
      await supabaseClient.from('balance').update({ 'balance': balanceAsint ,'emailAddress' : currentUser!.email});
}

// Future<void> invokeFunctionEveryMonth() async {
//   final response = await supabase.rpc('invoke_function_every_month');

// }


}


// CREATE FUNCTION invoke_function_every_month()
// RETURNS VOID AS $$
// DECLARE
//   day_of_month INT;
// BEGIN
//   SELECT salaryDate INTO day_of_month FROM balance ;

//   IF day_of_month > 0 AND day_of_month <= 31 THEN
//     cron.schedule(
//       'invoke-function-every-month',
//       '0 0 ' || day_of_month || ' * *', -- run on the specified day of every month at midnight
//       $$
//       UPDATE balance SET balance = balance + salary
//       $$
//     );
//   ELSE
//     RAISE EXCEPTION 'Invalid day of month. Please provide a value between 1 and 31.';
//   END IF;
// END;
// $$ LANGUAGE plpgsql;

