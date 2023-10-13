import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class ViewModelExplorePage extends BaseViewModel {
  Future<String> getCurrency() async {
    String currency='';
    String? currentEmail() {
      final String? cemail = AuthenticationService.currentUser?.email;
      //print(cemail);
      return cemail;
    }

    
final response = await supabase
  .from('balance')
  .select().execute();
      final data = response.data as List<dynamic>;

  for (var item in data) {
      final email = item['emailAddress'] as String;
      if (email == currentEmail()?.toString()) {
        currency = item['mainCurrency'];
      }
    }
    return currency;
  }

  Future<String> getBalance() async {
    String balance='';
    String? currentEmail() {
      final String? cemail = AuthenticationService.currentUser?.email;
      //print(cemail);
      return cemail;
    }

    
final response = await supabase
  .from('balance')
  .select().execute();
      final data = response.data as List<dynamic>;

  for (var item in data) {
      final email = item['emailAddress'] as String;
//print(currentEmail());
print(email == currentEmail()?.toString());
print(currentEmail()?.toString());
      if (email == currentEmail()?.toString()) {
        print('hhii ');
        balance = item['balance'].toString();
      }
    }
    return balance;
  }
}
