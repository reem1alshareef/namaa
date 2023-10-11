// import 'package:namaagp/services/authentication_service.dart';
// import 'package:stacked/stacked.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class ViewModelCurrencyChart extends BaseViewModel {
//   static Future<double> calculateCurrencyPercentage(String currencyName) async {
//     final supabaseClient = SupabaseClient(
//       'https://rpwqxndlhdiqkrejigse.supabase.co',
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
//     );
//     double percentage = 0;
//     final response = await supabaseClient.from('expenses').select().execute();
//     String? currentEmail() {
//       final String? cemail = AuthenticationService.currentUser?.email;
//       return cemail;
//     }
//     final data = response.data as List<dynamic>;

//     int totalData = 0;
//     double currencyAmount = 0;

//     for (var item in data) {
//       final email = item['emailAddress'] as String;
//       if (email == currentEmail()?.toString()) {
//         final currency = item['currency'] as String;
//         final price = item['price'] as double;
//         if (currency == currencyName) {
//           currencyAmount += price;
//         }
//         totalData++;
//       }
//     }

//     if (totalData > 0) {
//       percentage = (currencyAmount / totalData) * 100;
//     }
//     return percentage ; 
    
//   }

//   static Future<double> calculateRPercentage() async {
//     return await calculateCurrencyPercentage('ريال') ?? 0;
//   }

//   static Future<double> calculateDePercentage() async {
//     return await calculateCurrencyPercentage('درهم') ?? 0;
//   }

//   static Future<double> calculateDoPercentage() async {
//     return await calculateCurrencyPercentage('دولار') ?? 0;
//   }

//   static Future<double> calculateJPercentage() async {
//     return await calculateCurrencyPercentage('جنيه') ?? 0;
//   }

//   static Future<double> calculateUPercentage() async {
//     return await calculateCurrencyPercentage('يورو') ?? 0;
//   }
// }


import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewModelCurrencyChart extends BaseViewModel {
  static Future<double> calculateCurrencyPercentage(String currencyName) async {
    final supabaseClient = SupabaseClient(
      'https://rpwqxndlhdiqkrejigse.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
    );
    double percentage = 0;
    final response = await supabaseClient.from('expenses').select().execute();
    String? currentEmail() {
      final String? cemail = AuthenticationService.currentUser?.email;
      return cemail;
    }
    final data = response.data as List<dynamic>;

    int totalData = 0;
    double currencyAmount = 0;

    for (var item in data) {
      final email = item['emailAddress'] as String;
      if (email == currentEmail()?.toString()) {
        final currency = item['currency'] as String;
        final price = item['price'] as double;
        if (currency == currencyName) {
          currencyAmount += price;
        }
        totalData++;
      }
    }

    if (totalData > 0) {
      percentage = (currencyAmount / totalData) * 100;
    }

    return percentage;
  }

  static Future<double> calculateRPercentage() async {
    final percentage = await calculateCurrencyPercentage('ريال');
    return percentage ?? 0;
  }

  static Future<double> calculateDePercentage() async {
    final percentage = await calculateCurrencyPercentage('درهم');
    return percentage ?? 0;
  }

  static Future<double> calculateDoPercentage() async {
    final percentage = await calculateCurrencyPercentage('دولار');
    return percentage ?? 0;
  }

  static Future<double> calculateJPercentage() async {
    final percentage = await calculateCurrencyPercentage('جنيه');
    return percentage ?? 0;
  }

  static Future<double> calculateUPercentage() async {
    final percentage = await calculateCurrencyPercentage('يورو');
    return percentage ?? 0;
  }
}