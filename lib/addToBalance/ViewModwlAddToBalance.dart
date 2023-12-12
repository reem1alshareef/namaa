import 'dart:async';

import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClient = SupabaseClient('https://rpwqxndlhdiqkrejigse.supabase.co', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");


// String? currentEmail() {
//   final String? cemail = AuthenticationService.currentUser?.email;
//   return cemail;
  
// }
String? getCurrentUserEmail() {
  final currentUser = supabase.auth.currentUser;
    return currentUser?.email;
  
}

class ViewModelAddToBalance extends BaseViewModel {

  Future<void> addToBalance(String chosenCurrency, double money) async {
    final response = await supabaseClient
        .from('balance')
        .select()
        .eq('emailAddress', getCurrentUserEmail())
        .execute();

    final data = response.data as List<dynamic>;

    if (data.isEmpty) {
      // Insert a new row since no rows matched the condition
      final insertData = {
        'emailAddress': getCurrentUserEmail(),
        'UAE': chosenCurrency == 'درهم' ? money : '0',
        'SAR': chosenCurrency == 'ريال' ? money : '0',
        'EUR': chosenCurrency == 'يورو' ? money : '0',
        'US': chosenCurrency == 'دولار' ? money : '0',
        'GBP': chosenCurrency == 'جنيه' ? money : '0',
        'balance': calculateTotalBalance(chosenCurrency, money, data),
      };

      await supabaseClient.from('balance').upsert(insertData);
      print(insertData);
    } else {
      // Update the existing row with the new values
      final item = data.first;
      double totalBalance = calculateTotalBalance(chosenCurrency, money, data);

      final updateData = {
        'emailAddress': getCurrentUserEmail(),
        'UAE': chosenCurrency == 'درهم'
            ? (item['UAE'] + money)
            : item['UAE'],
        'SAR': chosenCurrency == 'ريال'
            ? (item['SAR'] + money)
            : item['SAR'],
        'EUR': chosenCurrency == 'يورو'
            ? (item['EUR'] + money)
            : item['EUR'],
        'US': chosenCurrency == 'دولار'
            ? (item['US'] + money)
            : item['US'],
        'GBP': chosenCurrency == 'جنيه'
            ? (item['GBP'] + money)
            : item['GBP'],
        'balance': totalBalance,
      };

      await supabaseClient.from('balance').upsert(updateData);
      print(updateData);
    }
  }

  double calculateTotalBalance(String chosenCurrency, double money, List<dynamic> data) {
    double totalBalance = 0.0;

    for (final item in data) {
      if (item['UAE'] != null) totalBalance += convertCurrency('درهم', item['UAE']);
      if (item['SAR'] != null) totalBalance += convertCurrency('ريال', item['SAR']);
      if (item['EUR'] != null) totalBalance += convertCurrency('يورو', item['EUR']);
      if (item['US'] != null) totalBalance += convertCurrency('دولار', item['US']);
      if (item['GBP'] != null) totalBalance += convertCurrency('جنيه', item['GBP']);
    }

    totalBalance += convertCurrency(chosenCurrency, money);

    return totalBalance;
  }

  double convertCurrency(String currency, double amount) {
    //double convertedValue = double.parse(amount);

    if (currency == 'دولار') {
      amount /= 3.75;
    } else if (currency == 'ريال') {
      amount /= 1;
    } else if (currency == 'يورو') {
      amount /= 3.95;
    } else if (currency == 'درهم') {
      amount /= 1.02;
    } else if (currency == 'جنيه') {
      amount /= 4.55;
    }

    return amount;
  }
  
}