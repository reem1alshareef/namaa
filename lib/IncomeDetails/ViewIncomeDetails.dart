import 'package:flutter/material.dart';
import 'package:namaagp/Components/AccountButton.dart';
import 'package:namaagp/Components/CostomizedTextButton.dart';
import 'package:namaagp/Components/CurrecyDropdownList.dart';
import 'package:namaagp/Components/DatePicker.dart';
import 'package:namaagp/Components/TextInputField.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:namaagp/IncomeDetails/ViewModelIncomeDetails.dart';

import 'package:stacked/stacked.dart';


class ViewIncomeDetails extends StatefulWidget {
    @override
    _ViewIncomeDetailsState createState() => _ViewIncomeDetailsState();
}
  
  final TextEditingController salaryDate=TextEditingController();
  final TextEditingController salary=TextEditingController();
  final TextEditingController currency=TextEditingController();

  class _ViewIncomeDetailsState extends State<ViewIncomeDetails>{
  
  final viewModel = ViewModelIncomeDetails();


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelIncomeDetails>.reactive(
        viewModelBuilder: () => ViewModelIncomeDetails(),
        builder: (context, viewmodel, _) {
          return Scaffold(
              backgroundColor: const Color(0x00071121),
              body: Container(
                padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                width: 428,
                height: 926,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  //maybe delete const
                  gradient: LinearGradient(
                    begin: Alignment(-0.00, -6.00),
                    end: Alignment(0, 1.5),
                    colors: [
                      Color(0xFF342D68),
                      Color(0xFF352D68),
                      Color(0x00352D68)
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                child: Column(
                  children: [
                    const SizedBox(height: 5,),
                    const mainHeader(title: 'إنشاء حساب',),
                    const SizedBox(height: 5,),
                    DatePicker(currency: salaryDate,),
                    //TextInputField(title: 'تاريخ الراتب', placeHolder: 'يوم الراتب', inputController: salaryDate,),
                    TextInputField(title: 'الراتب', placeHolder: 'اكتب راتبك', inputController: salary,),
                    CurrencyDropdownList(currency: currency),
                    //CurrencyDropdownList(currency: salary),
                    
                    //TextInputField(title: 'العملة', placeHolder: 'اختر عملتك', inputController: currency,),

                    const SizedBox(height: 5,),
                    AccountButton(title: 'أكمل', type: 'continue', name: salaryDate, emailAddress: salary, pin: currency,),
                    CostomizedTextButton(question: '', actionTitle: 'لا أملك دخل ثابت', purpose: 'SignIn',)
                  
                  ],
                )
              ));
        });
  }
  
}
