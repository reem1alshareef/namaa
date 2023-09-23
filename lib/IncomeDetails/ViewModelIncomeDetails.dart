//import 'package:namaagp/OTPPage/hi.dart';
import 'package:namaagp/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class ViewModelIncomeDetails extends BaseViewModel {
  //final hhh= hi();
  void addIncomeDetails(String salaryDate, String salary, String currency){

int currencyAsint = int.parse(currency);
int salaryAmountAsint = int.parse(salary);
int salaryBateAsInt = int.parse(salaryDate);

    supabase.from('balance').insert({'salaryDate': salaryBateAsInt ,'mainCurrency': currencyAsint , 'salary':salaryAmountAsint ,});
    
  var currentTime = DateTime.now();
  var totalBalance =  supabase.from('balance').select('totalBalance');
  // var salaryAmount =  supabase.from('balance').select('salaryAmount');
  // var salaryDate =  supabase.from('balance').select('salaryDate');

  int currentDayOfMonth = currentTime.day;// يجيب اليوم الحالي من الشهر 

  int totalBalanceAsint = totalBalance as int;
  //int salaryAmountAsint = salary as int;
  //int salaryBateAsInt = salaryDate as int ; 
  if (currentDayOfMonth==salaryBateAsInt){
    totalBalanceAsint  = totalBalanceAsint  + salaryAmountAsint ; 
      supabase.from('balance').update({'totalBalance': totalBalanceAsint}).execute();
      }// بيضيف الراتب كل شهر 

  }
}
