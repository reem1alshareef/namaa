import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewModelSalary extends BaseViewModel {

final supabase = Supabase.instance.client;

  updateSalary()  async {
  
  var currentTime = DateTime.now();
  var totalBalance = await supabase.from('balance').select('totalBalance');
  var salaryAmount = await supabase.from('balance').select('salaryAmount') ;
  var salaryDate = await supabase.from('balance').select('salaryDate') ;
  //int currentDayOfMonth = currentTime.day; يجيب اليوم من الشهر 
  if (currentTime==salaryDate){
    totalBalance = totalBalance + salaryAmount ; 
      await supabase
      .from('balance').update({'totalBalance': totalBalance});
      //.execute();
}

  }

}



