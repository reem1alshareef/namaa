import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewModelMoneyTimeChart extends BaseViewModel {
  static Future<double> calculateAverageByDayOfWeek(int dayOfWeek) async {
    final supabaseClient = SupabaseClient(
      'https://rpwqxndlhdiqkrejigse.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
    );

    final response = await supabaseClient.from('expenses').select().execute();
    String? currentEmail() {
      final String? cemail = AuthenticationService.currentUser?.email;
      return cemail;
    }

    final data = response.data as List<dynamic>;
    final pricesByDay = <int, List<int>>{}; // Map to store prices by day of the week

    for (var item in data) {
      final email = item['emailAddress'] as String;
      if (email == currentEmail()?.toString()) {
        final itemDate = DateTime.parse(item['date']);
      final itemDayOfWeek = itemDate.weekday;
        final adjustedDayOfWeek = (itemDayOfWeek == 7) ? 0 : itemDayOfWeek;
        pricesByDay[adjustedDayOfWeek] ??= [];
        //print(item['price'].toString());
        //print(pricesByDay[adjustedDayOfWeek].toString());
        pricesByDay[adjustedDayOfWeek]!.add(item['price']);//item['price'] as double
      }
    }

    final prices = pricesByDay[dayOfWeek] ?? []; // Get prices for the specified day of the week

    if (prices.isNotEmpty) {
      final total = prices.reduce((a, b) => a + b);
      final average = total / prices.length;
      return average;
    } else {
      return 0.0;
    }
  }

  static Future<double> getSundayAverage() async {
    final averageS = await calculateAverageByDayOfWeek(0);
    print('Sunday: $averageS');
    return averageS;
  }

  static Future<double> getMondayAverage() async {
    final averageM = await calculateAverageByDayOfWeek(1);
    print('Monday: $averageM');
    return averageM;
  }

  static Future<double> getTuesdayAverage() async {
    final averageT = await calculateAverageByDayOfWeek(2);
    print('Tuesday: $averageT');
    return averageT;
  }

  static Future<double> getWednesdayAverage() async {
    final averageW = await calculateAverageByDayOfWeek(3);
    print('Wednesday: $averageW');
    return averageW;
  }

  static Future<double> getThursdayAverage() async {
    final averageTh = await calculateAverageByDayOfWeek(4);
    print('Thursday: $averageTh');
    return averageTh;
  }

  static Future<double> getFridayAverage() async {
    final averageF = await calculateAverageByDayOfWeek(5);
    print('Friday: $averageF');
    return averageF;
  }

  static Future<double> getSaturdayAverage() async {
    final averageSa = await calculateAverageByDayOfWeek(6);
    print('Saturday: $averageSa');
    return averageSa;
  }
}