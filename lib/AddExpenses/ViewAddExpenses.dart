import 'package:flutter/material.dart';
import 'package:namaagp/Components/AccountButton.dart';
import 'package:namaagp/Components/CostomizedTextButton.dart';
import 'package:namaagp/Components/TextInputField.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:namaagp/AddExpenses/ViewModelAddExpenses.dart';
import 'package:stacked/stacked.dart';
import 'package:namaagp/Components/returntopreviouspage.dart';



class ViewAddExpenses extends StatelessWidget {
  TextEditingController mycontroller = TextEditingController();
   ViewAddExpenses({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelAddExpenses>.reactive(
        viewModelBuilder: () => ViewModelAddExpenses(),
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
                    SizedBox(height: 20,),
                    //ReturnToPreviousPage(title: 'البداية', tWidth: 400),
                   // introPagesHeader(title: '',subTitle: ''),
                    mainHeader(title: 'إضافة صرف',),
                    
                 Container(
  // width: 80,
  // height: 80,
  
  child: Stack(
    
    children: [
      SizedBox(
  width: 210,
  height: 45,
  child: Text(
    '0.00 ر. س',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 48,
      fontFamily: 'Noto Sans Arabic',
      fontWeight: FontWeight.w400,
      height: 0,
    ),
  ),
),
      Positioned(
        left: 0,
        top: 0,
        child: Container(
          
          width: 80,
          height: 80,
          decoration: ShapeDecoration(
            color: Color(0xFFB0ACD5),
            shape: OvalBorder(),
            shadows: [
              BoxShadow(
                color: Color(0xFFB0ACD5),
                blurRadius: 4,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
        ),
      ),
      Positioned(
        left: 15,
        top: 15,
        child: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Image.asset(
                          "assets/Icons/microphone-8-48.png",
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                        ),
                      ),]),
          width: 50,
          height: 50,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/Icons/microphone-8-48.png"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ),
      ),
    ],
  ),
)
                  ],
                )
              ));
        });
  }
}