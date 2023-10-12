import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:namaagp/AddExpenses/ViewModelAddExpenses.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/foundation.dart';
import 'utils.dart';
import 'package:namaagp/Components/CurrencyDropdownList.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewAddExpenses extends StatefulWidget {
  ViewAddExpenses({super.key});

  @override
  State<ViewAddExpenses> createState() => _ViewAddExpensesState();
}

class _ViewAddExpensesState extends State<ViewAddExpenses> {
  late TextEditingController mycontroller = TextEditingController();
  late Future<DateTime?> selectedDate;

  //DATAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
  late int data = 0;
  String date = "انقر لتحديد التاريخ";
  String? _chosenCurrency = 'العملة';
  late String categoryName ;

  //String? dynamic _category = category[categoryIndex];

  List category = [
    "شخصي",
    "مواصلات",
    "المنزل",
    "غذاء",
    "صحة",
    "ترفيه",
    "أخرى",
  ];

  void showDialogPicker(BuildContext context) {
    selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              // primary: MyColors.primary,
              primary: Color.fromARGB(255, 26, 28, 62),
              onPrimary: Color.fromARGB(255, 195, 197, 232),
              surface: Color.fromARGB(255, 195, 197, 232),
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    selectedDate.then((value) {
      setState(() {
        if (value == null) return;
        date = Utils.getFormattedDateSimple(value.millisecondsSinceEpoch);
      });
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  int selectedIndex = -1;

  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelAddExpenses>.reactive(
        viewModelBuilder: () => ViewModelAddExpenses(),
        builder: (context, viewmodel, _) {
          return Scaffold(
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
                      title: 'إضافة صرف',
                    ),

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
                              'جنية',
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
                              '$_chosenCurrency',
                              style: GoogleFonts.getFont("Noto Sans Arabic",
                                  color: Color.fromARGB(185, 195, 197, 232),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _chosenCurrency = value;
                                print('$_chosenCurrency');
                              });
                            },
                            //icon: Image.asset("assets/Icons/down-arrow.png",height: 15,width: 15,),
                          ),
                        ),
                        SizedBox(
                            width: 105,
                            child: TextField(
                                onSubmitted: (value) {
                                  setState(() {
                                    var expense = value;
                                    print("$expense");
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
                    TextButton(
                      style: TextButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color.fromARGB(0, 25, 26, 62),
                          textStyle: GoogleFonts.getFont("Noto Sans Arabic",
                              fontSize: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(horizontal: 30)),
                      child: Text("$date",
                          style: TextStyle(
                              color: const Color.fromARGB(119, 255, 255, 255))),
                      onPressed: () {
                        showDialogPicker(context);
                        print("$date");
                      },
                    ),

                    SingleChildScrollView(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            height: 150,
                            child: ListView.separated(
                              itemCount: category.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, categoryIndex) =>
                                  FilterChip(
                                      label: Text(category[categoryIndex]),
                                      labelStyle: GoogleFonts.getFont(
                                          "Noto Sans Arabic",
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)),
                                      selected: categoryIndex == selectedIndex,
                                      selectedColor:
                                          Color.fromARGB(255, 208, 205, 239),
                                      backgroundColor:
                                          Color.fromARGB(255, 58, 52, 98),
                                      onSelected: (value) {
                                        setState(() {
                                          selectedIndex = categoryIndex;
                                          categoryName = category[categoryIndex];
                                          print(categoryName.runtimeType);
                                        });
                                      }),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                width: 15,
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          width: 401,
                          height: 0.5,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(132, 217, 217, 217),
                          ),
                        ),

                        Text(':لإضافة صرف باستخدام الادخال الصوتي',
                            style: GoogleFonts.getFont("Noto Sans Arabic",
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                textStyle:
                                    const TextStyle(color: Color(0xFFC5C5CD)))),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            width: 10.0,
                            height: 15.0,
                          ), //Container
                        ), //Padding
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        elevation: 15,
                                        backgroundColor:
                                            Color.fromARGB(255, 176, 172, 213),
                                        child: Container(
                                          height: 200,
                                          width: 500,
                                          child: Text(
                                            ' :استخدم الصيغة التالية',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.getFont(
                                              "Noto Sans Arabic",
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 58, 52, 98),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Image.asset(
                                  "assets/Icons/microphone-8-48.png",
                                  height: 50,
                                  width: 45,
                                  fit: BoxFit.contain),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 176, 172, 213),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),

                                    //border radius equal to or more than 50% of width
                                  )),
                            ))
                      ],
                    ))
                  ])));
        });
  }
}
    
    
        // child: Text("العملة"))

//                  Container(
//    width: 80,
//    height: 80,

//   child: Stack(

// children:
// [
//       Positioned(
//         left: 0,
//         top: 0,
//         child: Container(

//           width: 80,
//           height: 80,
//           decoration: ShapeDecoration(
//             color: Color(0xFFB0ACD5),
//             shape: OvalBorder(),
//             shadows: [
//               BoxShadow(
//                 color: Color(0xFFB0ACD5),
//                 blurRadius: 4,
//                 offset: Offset(0, 0),
//                 spreadRadius: 0,
//               )
//             ],
//           ),
//         ),
//       ),
        // mic button
        // Positioned(
        //   left: 15,
        //   top: 15,
        //   child: Container(
        //     child: Row(mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Flexible(
        //                   child: Image.asset(
        //                     "assets/Icons/microphone-8-48.png",
        //                     height: 30,
        //                     width: 30,
        //                     fit: BoxFit.contain,

        // ]
        // ),
        //     width: 50,
        //     height: 50,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/Icons/microphone-8-48.png"),
        //     fit: BoxFit.cover,
      
    

//            ),
//         ),
//       ),
//                 ]),)],
//   ),
// )
//                   ,
//            );

//         });
//   }


  
