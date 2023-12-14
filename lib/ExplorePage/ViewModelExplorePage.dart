import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class ViewModelExplorePage extends BaseViewModel {
  Future<String> getCurrency() async {
    String currency='';
    // String? currentEmail() {
    //   final String? cemail = AuthenticationService.currentUser?.email;
    //   //print(cemail);
    //   return cemail;
    // }

     String? getCurrentUserEmail() {
  final currentUser = supabase.auth.currentUser;
    return currentUser?.email;
  
}

    
final response = await supabase
  .from('balance')
  .select().execute();
      final data = response.data as List<dynamic>;

  for (var item in data) {
      final email = item['emailAddress'] as String;
      if (email == getCurrentUserEmail()) {
        currency = item['mainCurrency'];
      }
    }
    return currency;
  }

  Future<String> getBalance() async {
    String balance='';
     String? getCurrentUserEmail() {
  final currentUser = supabase.auth.currentUser;
    return currentUser?.email;
  
}

    
final response = await supabase
  .from('balance')
  .select().execute();
      final data = response.data as List<dynamic>;

  for (var item in data) {
      final email = item['emailAddress'] as String;
//print(currentEmail());
print(email == getCurrentUserEmail());
print(getCurrentUserEmail());
      if (email == getCurrentUserEmail()) {
        print('hhii ');
        balance = item['balance'].toString();
      }
    }
    return balance;
  }
}