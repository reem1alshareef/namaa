import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewModelViewExpenses extends BaseViewModel {
  
  static Future<List<dynamic>> getExpenses() async {
    //List<Todo>? _todos;
    final supabaseClient = SupabaseClient(
      'https://rpwqxndlhdiqkrejigse.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
    );
    
    String? currentEmail() {
      final String? cemail = AuthenticationService.currentUser?.email;
      return cemail;
    }

    final response = await supabaseClient.from('expenses').select().eq('emailAddress', currentEmail()).execute();
    
    
    return (response.data as List<dynamic>);//.map((e) => Todo.fromMap(e)).toList();

    // final data = response.data as List<dynamic>;
    // final pricesByDay = <int, List<int>>{}; // Map to store prices by day of the week

    // for (var item in data) {
    //   final email = item['emailAddress'] as String;
    //   if (email == currentEmail()?.toString()) {
    //     final itemDate = DateTime.parse(item['date']);
    //   final itemDayOfWeek = itemDate.weekday;
    //     final adjustedDayOfWeek = (itemDayOfWeek == 7) ? 0 : itemDayOfWeek;
    //     pricesByDay[adjustedDayOfWeek] ??= [];

    //     pricesByDay[adjustedDayOfWeek]!.add(item['price']);//item['price'] as double
    //   }
    // }

    // final prices = pricesByDay[dayOfWeek] ?? []; 
  }
}