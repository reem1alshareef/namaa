import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewModelCategoryChart extends BaseViewModel {
  static Future<double> calculateCategoryPercentage(String categoryName) async {
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
       String? getCurrentUserEmail() {
  final currentUser = supabase.auth.currentUser;
    return currentUser?.email;
  
}
    
    final data = response.data as List<dynamic>;

    int totalData = 0;
    double categoryPrice = 0;

    for (var item in data) {
      final email = item['emailAddress'] as String;
      if (email == getCurrentUserEmail()) {
        final category = item['category'] as String;
        final price = item['price'] as double;
        if (category == categoryName) {
          categoryPrice += price;
        }
        totalData++;
      }
    }

    if (totalData > 0) {
      percentage = (categoryPrice / totalData) * 100;
    }
    return percentage;
  }

  static Future<double> calculateHomePercentage() async {
    return await calculateCategoryPercentage('المنزل');
  }

  static Future<double> calculateFoodPercentage() async {
    return await calculateCategoryPercentage('غذاء');
  }

  static Future<double> calculateHelthPercentage() async {
    return await calculateCategoryPercentage('صحة');
  }

  static Future<double> calculatePersonalPercentage() async {
    return await calculateCategoryPercentage('شخصي');
  }

  static Future<double> calculateEntertainmentPercentage() async {
    return await calculateCategoryPercentage('ترفيه');
  }

  static Future<double> calculateOtherPercentage() async {
    return await calculateCategoryPercentage('أخرى');
  }

  static Future<double> calculateTransportationPercentage() async {
    return await calculateCategoryPercentage('مواصلات');
  }
}