import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClient = SupabaseClient('https://rpwqxndlhdiqkrejigse.supabase.co', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");


String? currentEmail() {
  final String? cemail = AuthenticationService.currentUser?.email;
  return cemail;
  
}
class ViewModelAddToBalance extends BaseViewModel {
  Future<void> addToBalance(String chosenCurrency, String money) async {
    final response = await supabaseClient
        .from('balance')
        .select()
        .eq('emailAddress', currentEmail().toString())
        .execute();

    final data = response.data as List<dynamic>;

    if (data.isEmpty) {
      // Insert a new row since no rows matched the condition
      final insertData = {
        'emailAddress': currentEmail().toString(),
        'UAE': chosenCurrency == 'درهم' ? money : '0',
        'SAR': chosenCurrency == 'ريال' ? money : '0',
        'EUR': chosenCurrency == 'يورو' ? money : '0',
        'US': chosenCurrency == 'دولار' ? money : '0',
        'GBP': chosenCurrency == 'جنيه' ? money : '0',
        'balance': calculateTotalBalance(chosenCurrency, money, data),
      };

      await supabaseClient.from('balance').insert(insertData);
      print(insertData);
    } else {
      // Update the existing row with the new values
      final item = data.first;
      double totalBalance = calculateTotalBalance(chosenCurrency, money, data);

      final updateData = {
        'emailAddress': currentEmail().toString(),
        'UAE': chosenCurrency == 'درهم'
            ? (double.parse(item['UAE'].toString()) + double.parse(money)).toString()
            : item['UAE'].toString(),
        'SAR': chosenCurrency == 'ريال'
            ? (double.parse(item['SAR'].toString()) + double.parse(money)).toString()
            : item['SAR'].toString(),
        'EUR': chosenCurrency == 'يورو'
            ? (double.parse(item['EUR'].toString()) + double.parse(money)).toString()
            : item['EUR'].toString(),
        'US': chosenCurrency == 'دولار'
            ? (double.parse(item['US'].toString()) + double.parse(money)).toString()
            : item['US'].toString(),
        'GBP': chosenCurrency == 'جنيه'
            ? (double.parse(item['GBP'].toString()) + double.parse(money)).toString()
            : item['GBP'].toString(),
        'balance': totalBalance.toString(),
      };

      await supabaseClient.from('balance').upsert(updateData);
      print(updateData);
    }
  }

  double calculateTotalBalance(String chosenCurrency, String money, List<dynamic> data) {
    double totalBalance = 0.0;

    for (final item in data) {
      if (item['UAE'] != null) totalBalance += convertCurrency('درهم', item['UAE'].toString());
      if (item['SAR'] != null) totalBalance += convertCurrency('ريال', item['SAR'].toString());
      if (item['EUR'] != null) totalBalance += convertCurrency('يورو', item['EUR'].toString());
      if (item['US'] != null) totalBalance += convertCurrency('دولار', item['US'].toString());
      if (item['GBP'] != null) totalBalance += convertCurrency('جنيه', item['GBP'].toString());
    }

    totalBalance += convertCurrency(chosenCurrency, money);

    return totalBalance;
  }

  double convertCurrency(String currency, String amount) {
    double convertedValue = double.parse(amount);

    if (currency == 'دولار') {
      convertedValue /= 3.75;
    } else if (currency == 'ريال') {
      convertedValue /= 1;
    } else if (currency == 'يورو') {
      convertedValue /= 3.95;
    } else if (currency == 'درهم') {
      convertedValue /= 1.02;
    } else if (currency == 'جنيه') {
      convertedValue /= 4.55;
    }

    return convertedValue;
  }
}