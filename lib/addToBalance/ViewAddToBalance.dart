import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/AddExpenses/ViewModelAddExpenses.dart';
import 'package:namaagp/Components/CustomButton.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:namaagp/addToBalance/ViewModwlAddToBalance.dart';
import 'package:stacked/stacked.dart';

class ViewAddToBalance extends StatefulWidget {
  ViewAddToBalance({super.key});
  @override
  State<ViewAddToBalance> createState() => _ViewAddToBalanceState();
}
class _ViewAddToBalanceState extends State<ViewAddToBalance> {
  

  final TextEditingController moneyController = TextEditingController();

  
  late String? chosenCurrency = 'العملة';
  
  late String money = ''  ;


  int selectedIndex = -1;
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelAddExpenses>.reactive(
        viewModelBuilder: () => ViewModelAddExpenses(),
        builder: (context, viewmodel, _) {
          return Scaffold(
             resizeToAvoidBottomInset: false, 
              backgroundColor: const Color(0x00071121),
              body: Container(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 10, right: 10),
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
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    //ReturnToPreviousPage(title: 'البداية', tWidth: 400),
                    // introPagesHeader(title: '',subTitle: ''),
                    mainHeader(
                      title: 'إضافة مال',
                    ),
                    SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: DropdownButton<String>(
                            underline: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0))),
                            ),
                            focusColor: Color.fromARGB(255, 195, 197, 232),
                            dropdownColor: Color.fromARGB(255, 26, 28, 62),

                            //elevation: 5,
                            style: TextStyle(
                                color:
                                    const Color.fromARGB(255, 195, 197, 232)),
                            iconEnabledColor: Colors.black,
                            items: <String>[
                              'ريال',
                              'درهم',
                              'دولار',
                              'جنيه',
                              'يورو',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.getFont("Noto Sans Arabic",
                                      color: const Color.fromARGB(
                                          255, 195, 197, 232),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              '$chosenCurrency',
                              style: GoogleFonts.getFont("Noto Sans Arabic",
                                  color: Color.fromARGB(185, 195, 197, 232),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                chosenCurrency = value;
                                print('$chosenCurrency');
                              });
                            },
                            //icon: Image.asset("assets/Icons/down-arrow.png",height: 15,width: 15,),
                          ),
                        ),
                        SizedBox(
                            width: 105,
                            child: TextField(
                              controller: moneyController,
                                onChanged: (value) {
                                  setState(() {
                                    money = value;
                                    print("$money");
                                  });
                                  //value is entered text after ENTER press
                                  //you can also call any function here or make setState() to assign value to other variable
                                },
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                    fontFamily: "Noto Sans Arabic",
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ])),
                      ],
                    ),

SizedBox(height: 200),
Align(
  alignment: Alignment.bottomCenter,
  child: CustomButton(
    title: 'تأكيد الإضافة',
    onPressed: () {
      if ( chosenCurrency == 'العملة' ) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('تنبيه'),
              content: Text(' الرجاء اختيار العملة'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('موافق'),
                ),
              ],
            );
          },
        );
      }
      
      if (money.isEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('تنبيه'),
              content: Text('الرجاء إدحال المبلغ المراد إضافته '),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('موافق'),
                ),
              ],
            );
          },
        );
      }
      else {
        
        ViewModelAddToBalance().addToBalance( chosenCurrency!,  double.parse(money));
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('تم حفظ البيانات بنجاح'),
            );
          },
        ).then((value) {
          setState(() {
            // Reset the widget values to their initial values
            chosenCurrency = 'العملة';
            moneyController.clear();
          });
          
        });
      }
    },
  ),
),
],
    ),
        ),
          );
  });
  }
}
