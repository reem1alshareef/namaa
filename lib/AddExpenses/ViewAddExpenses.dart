import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/AddExpenses/ViewModelAddExpenses.dart';
import 'package:namaagp/AddExpenses/speech.dart';
import 'package:namaagp/Components/CustomButton.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:stacked/stacked.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'utils.dart';

class ViewAddExpenses extends StatefulWidget {
  ViewAddExpenses({super.key});
  @override
  State<ViewAddExpenses> createState() => _ViewAddExpensesState();
}

class _ViewAddExpensesState extends State<ViewAddExpenses> {
  late TextEditingController mycontroller = TextEditingController();
  late Future<DateTime?> selectedDate;

  final TextEditingController expenseController = TextEditingController();

  late int data = 0;
  late String date = "انقر لتحديد التاريخ";
  late String? chosenCurrency = 'العملة';
  late String categoryName = '';
  late String expense = '';

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
      lastDate: DateTime.now(),
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
        sendDate() {
          return date;
        }

        ;
      });
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  int selectedIndex = -1;

  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;
  String _wordsSpoken = "";
  double _confidenceLevel = 0;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
      _confidenceLevel = result.confidence;
    });
  }

  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelAddExpenses>.reactive(
        viewModelBuilder: () => ViewModelAddExpenses(),
        builder: (context, viewmodel, _) {
          return Scaffold(
             resizeToAvoidBottomInset: false, 
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
                          alignment: Alignment.bottomCenter,
                          underline: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.transparent,
                                        width: 0.0))),
                          ),
                          focusColor: Color.fromARGB(255, 195, 197, 232),
                          dropdownColor: Color.fromARGB(255, 26, 28, 62),
                          icon: Image.asset(
                            'assets/Icons/down-arrow.png',
                            height: 20,
                            width: 20,
                          ),
                          padding: EdgeInsets.all(16),
                          //elevation: 5,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 195, 197, 232),
                          ),
                          iconEnabledColor: const Color.fromARGB(0, 0, 0, 0),
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
                                textAlign: TextAlign.right,
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
                            textAlign: TextAlign.right,
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
                              //  textAlign: TextAlign.right,
                              controller: expenseController,
                              onChanged: (value) {
                                setState(() {
                                  expense = value;
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
                                    shape: RoundedRectangleBorder(
                                      
                            borderRadius: BorderRadius.circular(30)),
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
                                          if (value) {
                                            selectedIndex = categoryIndex;
                                            categoryName =
                                                category[categoryIndex];
                                          } else {
                                            selectedIndex =
                                                -1; // Reset the selectedIndex
                                            categoryName =
                                                ''; // Reset the categoryName
                                          }
                                          // selectedIndex = categoryIndex;
                                          // categoryName = category[categoryIndex];
                                          // print(categoryName.runtimeType);
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Speech()),
                              );
                            },
                            // async {
                            //   showModalBottomSheet(
                            //     context: context,
                            //     builder: (context) {
                            //       return Column(
                            //         mainAxisSize: MainAxisSize.max,
                            //         children: <Widget>[
                            //           ListTile(
                            //             //   leading: new Icon(Icons.photo),
                            //             title: Center(
                            //                 child: new Text('الادخال الصوتي',
                            //                     style: GoogleFonts.getFont(
                            //                       "Noto Sans Arabic",
                            //                       fontSize: 16,
                            //                     ))),
                            //             onTap: () {
                            //               Navigator.pop(context);
                            //             },
                            //           ),
                            //           Container(
                            //             height: 200,
                            //             width: 500,
                            //             child: Center(
                            //               child: Text(
                            //                 _speechToText.isListening
                            //                     ? "الرجاء التحدث بالصيغة التالية: \n صرفت عشرة ريال في يوم واحد ديسمبر فئة شخصي "
                            //                     : _speechEnabled
                            //                         ? "انقر الأيقونة لبدء الادخال الصوتي"
                            //                         : "لايمكن الوصول للادخال الصوتي",
                            //                 style: GoogleFonts.getFont(
                            //                   "Noto Sans Arabic",
                            //                   fontSize: 20,
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //           Container(
                            //             padding: EdgeInsets.all(16),
                            //             child: Text(_wordsSpoken,
                            //                 style: GoogleFonts.getFont(
                            //                     "Noto Sans Arabic",
                            //                     fontSize: 20,
                            //                     fontWeight: FontWeight.w400)),
                            //           ),
                            //           ElevatedButton(
                            //               onPressed: _speechToText.isListening
                            //                   ? _stopListening
                            //                   : _startListening,
                            //               child: Icon(
                            //                 _speechToText.isNotListening
                            //                     ? Icons.mic_off
                            //                     : Icons.mic,
                            //                 color: Color(0xFFC5C5CD),
                            //               ),
                            //               style: ElevatedButton.styleFrom(
                            //                   primary: Color.fromARGB(
                            //                       255, 37, 37, 123)))
                            //         ],
                            //       );
                            //     },
                            //   );
                            // },
            
                            // {
                            //                           showDialog(
                            //                               context: context,
                            //                               builder: (context) {
                            //                                 return Dialog(
                            //                                   shape: RoundedRectangleBorder(
                            //                                       borderRadius:
                            //                                           BorderRadius.circular(15)),
                            //                                   elevation: 15,
                            //                                   backgroundColor:
                            //                                       Color.fromARGB(255, 176, 172, 213),
                            //                                   child: Column(
                            //                                     children: [
                            //                                       Container(
                            //                                         height: 200,
                            //                                         width: 500,
                            //                                         child:  Text(
                            //           _speechToText.isListening
                            //               ? "الرجاء التحدث بالصيغة التالية: \n صرفت عشرة ريال في يوم واحد ديسمبر فئة شخصي "
                            //               : _speechEnabled
                            //                   ? "انقر الأيقونة لبدء التعرف الصوتي"
                            //                   : "لايمكن الوصول للتعرف الصوتي",
                            //           style: TextStyle(fontSize: 20.0),
                            //         ),
            
                            //                                       ),
                            //                                        Container(
                            //           padding: EdgeInsets.all(16),
                            //           child: Text(
                            //             _wordsSpoken,
                            //             style: const TextStyle(
                            //               fontSize: 25,
                            //               fontWeight: FontWeight.w300,
                            //             ),
                            //           ),
            
                            //       ),
                            //       ElevatedButton( onPressed: _speechToText.isListening ? _stopListening : _startListening,
            
                            //   child: Icon(
                            //     _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                            //     color: Color(0xFFC5C5CD),
                            //   ),
                            //  style:ElevatedButton.styleFrom( primary: Color.fromARGB(255, 37, 37, 123))
                            //  )
                            //                                     ],
                            //                                   ),
            
                            //                                 );
                            //                               });
                            //                         },
                            child: Image.asset(
                                "assets/Icons/microphone-8-48.png",
                                height: 50,
                                width: 40,
                                fit: BoxFit.contain),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 176, 172, 213),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  //border radius equal to or more than 50% of width
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      title: 'تأكيد الإضافة',
                      onPressed: () {
                        if (date == "انقر لتحديد التاريخ") {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                                                                
               backgroundColor: Color.fromARGB(174, 56, 56, 56),
                   
                    shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFC05454)),
            borderRadius: BorderRadius.circular(20),),
                                title: Text('تنبيه',
                                textAlign:
                                                            TextAlign.center,style:
                                                            GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 25,
                                                          color: Color.fromARGB(255, 192, 84, 84),
                                                          fontWeight:
                                                              FontWeight.w400,),),
                               
                                content: Text('الرجاء تحديد التاريخ', textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 17,
                                                          color: Color.fromARGB(255, 201, 138, 138),
                                                          fontWeight:
                                                              FontWeight.w400,)),
                                actions: [
                                  ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 157, 77, 86),
                      ),
                                                        child: Text('موافق',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .getFont(
                                                              "Noto Sans Arabic",
                                                              fontSize: 16,
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            )),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }
                                    
                                    
                                  ),
                                ],
                                 actionsAlignment:
                                                        MainAxisAlignment
                                                            .center
                              );
                            }
                          );
                        }else if(date==DateTime.now().toString()){
            
                        }else
                        if (chosenCurrency == 'العملة') {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                                                                
               backgroundColor: Color.fromARGB(174, 56, 56, 56),
                   
                    shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFC05454)),
            borderRadius: BorderRadius.circular(20),),
                                title: Text('تنبيه',textAlign:
                                                            TextAlign.center,style:
                                                            GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 25,
                                                          color: Color.fromARGB(255, 192, 84, 84),
                                                          fontWeight:
                                                              FontWeight.w400,),),
                                content: Text(' الرجاء اختيار العملة', textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 17,
                                                          color: Color.fromARGB(255, 201, 138, 138),
                                                          fontWeight:
                                                              FontWeight.w400,)),
                                actions: [
                                   ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 157, 77, 86),
                      ),
                                                        child: Text('موافق',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .getFont(
                                                              "Noto Sans Arabic",
                                                              fontSize: 16,
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            )),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    
                                    
                                  ),
                                ],
                                 actionsAlignment:
                                                        MainAxisAlignment
                                                            .center
                              );
                            },
                          );
                        }
                        if (categoryName.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                                                                
               backgroundColor: Color.fromARGB(174, 56, 56, 56),
                   
                    shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFC05454)),
            borderRadius: BorderRadius.circular(20),),
                                title: Text('تنبيه',textAlign:
                                                            TextAlign.center,style:
                                                            GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 25,
                                                          color: Color.fromARGB(255, 192, 84, 84),
                                                          fontWeight:
                                                              FontWeight.w400,)),
                                content: Text(' الرجاء تحديد فئة الصرف', textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 17,
                                                          color: Color.fromARGB(255, 201, 138, 138),
                                                          fontWeight:
                                                              FontWeight.w400,)),
                                actions: [
                                   ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 157, 77, 86),
                      ),
                                                        child: Text('موافق',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .getFont(
                                                              "Noto Sans Arabic",
                                                              fontSize: 16,
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            )),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    
                                    
                                  ),
                                ],
                                 actionsAlignment:
                                                        MainAxisAlignment
                                                            .center
                              );
                            },
                          );
                        }
                        if (expense.isEmpty) {
                          showDialog(
                            
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                                                                
               backgroundColor: Color.fromARGB(174, 56, 56, 56),
                   
                    shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFC05454)),
            borderRadius: BorderRadius.circular(20),),
                                title: Text('تنبيه',textAlign:
                                                            TextAlign.center,style:
                                                            GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 25,
                                                          color: Color.fromARGB(255, 192, 84, 84),
                                                          fontWeight:
                                                              FontWeight.w400,)),
                                content: Text('الرجاء إدخال مبلغ الصرف',
                                textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 17,
                                                          color: Color.fromARGB(255, 201, 138, 138),
                                                          fontWeight:
                                                              FontWeight.w400,)),
                                actions: [
                                  ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 157, 77, 86),
                      ),
                                                        child: Text('موافق',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .getFont(
                                                              "Noto Sans Arabic",
                                                              fontSize: 16,
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            )),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    
                                    
                                  ),
                                ],
                                actionsAlignment:
                                                        MainAxisAlignment
                                                            .center
                              );
                            },
                          );
                        } else {
                          ViewModelAddExpenses().addExpenses(
                              date, chosenCurrency!, categoryName, expense);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                
                                 backgroundColor: Color.fromARGB(174, 56, 56, 56),
                   
                    shape: RoundedRectangleBorder(
                      
            side: BorderSide(width: 1, color: Color.fromARGB(255, 195, 197, 232)),
            borderRadius: BorderRadius.circular(20),
                    ),
                                content: Text('تم حفظ البيانات بنجاح', textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 20,
                                                          color: Color.fromARGB(255, 195, 197, 232),
                                                          fontWeight:
                                                              FontWeight.w400,)),
                              );
                            },
                          ).then((value) {
                            setState(() {
                              // Reset the widget values to their initial values
                              date = "انقر لتحديد التاريخ";
                              chosenCurrency = 'العملة';
                              selectedIndex = -1; // Reset the selectedIndex
                              categoryName = '';
                              expenseController.clear();
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
