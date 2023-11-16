import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:namaagp/AddExpenses/speech_header.dart';

import 'package:supabase/supabase.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:namaagp/AddExpenses/utils.dart';
import 'dart:math';


class ViewAddPlan extends StatefulWidget {
  ViewAddPlan({super.key});
  @override
  State<ViewAddPlan> createState() => _ViewAddPlanState();
}


var intV = Random().nextInt(10);




String balance = '15000';
String goalName = '';
String goal = '';
String date = '';
String date2 = '';
late Future<DateTime?> selected_startdate;
late Future<DateTime?> selected_enddate;

showdatepicker(BuildContext context) {
  selected_startdate = showDatePickerDialog(
    context: context,
    initialDate: DateTime.now(),
    minDate: DateTime(2021, 1, 1),
    maxDate: DateTime(2023, 12, 31),
  );
  selected_startdate.then((value) {
    if (value == null) return;
    date = Utils.getFormattedDateSimple(value.millisecondsSinceEpoch);

    sendDate() {
      return date;
    }

    ;
  });
}

showdatepicker2(BuildContext context) {
  selected_enddate = showDatePickerDialog(
    context: context,
    initialDate: DateTime.now(),
    minDate: DateTime(2021, 1, 1),
    maxDate: DateTime(2023, 12, 31),
  );
  selected_enddate.then((value) {
    if (value == null) return;
    date2 = Utils.getFormattedDateSimple(value.millisecondsSinceEpoch);

    sendDate() {
      return date2;
    }

    ;
  });
}

int saved = 900;
final supabaseClient = SupabaseClient(
    'https://rpwqxndlhdiqkrejigse.supabase.co',
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU");

class _ViewAddPlanState extends State<ViewAddPlan> {
  final _future =
      supabaseClient.from('savingPlan').select<List<Map<String, dynamic>>>();

  Future<void> addPlan(
    String startdate,
    String enddate,
    String goal,
    String goalName,
  ) async {
    await supabaseClient.from('savingPlan').insert({
      'startDate': startdate,
      'endDate': enddate,
      'goal': goal,
      'goalName': goalName
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0x00071121),
        body: FutureBuilder<List<Map<String, dynamic>>>(
            future: _future,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final savingPlan = snapshot.data!;

              return Container(
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
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Speech_header(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('خطط الإدخار ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont("Noto Sans Arabic",
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              textStyle:
                                  const TextStyle(color: Color(0xFFD0CDEF)))),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    // width: 401,
                    height: 0.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: 401,
                    height: 0.5,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(132, 217, 217, 217),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    // width: 401,
                    height: 5,
                  ),
                  Stack(alignment: Alignment.center, children: [
                    SizedBox(
                      width: 75,
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: Color.fromARGB(151, 53, 45, 104),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 2,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text('رس',
                          style: GoogleFonts.getFont("Noto Sans Arabic",
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)))),
                      Text(' $saved ',
                          style: GoogleFonts.getFont("Noto Sans Arabic",
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)))),
                      Text(': تم إدخار',
                          style: GoogleFonts.getFont("Noto Sans Arabic",
                              fontSize: 25,
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
                      ),
                    ])
                  ]),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    // width: 401,
                    height: 50,
                  ),
                  Text('خطط الادخار',
                      style: GoogleFonts.getFont("Noto Sans Arabic",
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          textStyle: const TextStyle(color: Color(0xFFC5C5CD)))),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: savingPlan.length,
                      itemBuilder: (context, index) {
                        final item = savingPlan[index];
                        return Container(
                          height: 130,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Color.fromARGB(151, 53, 45, 104),
                            elevation: 10,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 150.0,
                                      height: 50.0,
                                      child: Text(item['goalName'],
                                          style: GoogleFonts.getFont(
                                              "Noto Sans Arabic",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5,
                                              textStyle: const TextStyle(
                                                  color: Color(0xFFC5C5CD)))),
                                    ),
                                  ),
                                ),
                                Text(' رس',  style: GoogleFonts.getFont(
                                          "Noto Sans Arabic",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          textStyle: const TextStyle(
                                              color: Color.fromARGB(255, 197, 197, 205)))),
                              
                                Container(
                                 padding: EdgeInsets.all(10.0),
                                  child: Text('$intV',
                                      style: GoogleFonts.getFont(
                                          "Noto Sans Arabic",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          textStyle: const TextStyle(
                                              color: Color(0xFFC5C5CD)))),
                                  // child: Chip(
                                  //   label: Text('@anonymous'),
                                  //   shadowColor: Colors.blue,
                                  //   backgroundColor: Colors.green,
                                  //   elevation: 10,
                                  //   autofocus: true,
                                  // )
                                ),
                                Text('/ ',  style: GoogleFonts.getFont(
                                          "Noto Sans Arabic",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          textStyle: const TextStyle(
                                              color: Color.fromARGB(145, 197, 197, 205)))),
                                 Container(
                                 //padding: EdgeInsets.all(10.0),
                                  child:
                                Text(item['goal'].toString(),  style: GoogleFonts.getFont(
                                          "Noto Sans Arabic",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          textStyle: const TextStyle(
                                              color: Color.fromARGB(145, 197, 197, 205))))),

                              ]           
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      FloatingActionButton.extended(
                          backgroundColor: Color(0xFF3A3462),
                          label: Text(' إضافة خطة إدخار',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont("Noto Sans Arabic",
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  textStyle: const TextStyle(
                                      color: Color(0xFFD0CDEF)))),
                          onPressed: () {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              backgroundColor: Color(0xFF302A56),
                              context: context,
                              builder: (context) {
                                return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                      ),
                                      Container(
                                        //margin: EdgeInsets.only(bottom: 20),
                                        width: 70,
                                        height: 5.5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: Color.fromARGB(
                                              132, 217, 217, 217),
                                        ),
                                      ),
                                      ListTile(
                                        //leading: new Icon(Icons.photo),
                                        title: new Text(' إضافة خطة إدخار',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.getFont(
                                                "Noto Sans Arabic",
                                                fontSize: 24,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5,
                                                textStyle: const TextStyle(
                                                    color: Color(0xFFD0CDEF)))),

                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 75,
                                                ),
                                                Container(
                                                  width: 200,
                                                  height: 50,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: ShapeDecoration(
                                                    color: Color.fromARGB(
                                                        151, 53, 45, 104),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 200.0,
                                                    child: TextFormField(
                                                        onChanged: (value) {
                                                          setState(() {
                                                            goalName = value;
                                                            print("$goalName");
                                                          });
                                                        },
                                                        textAlign: TextAlign
                                                            .center,
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        cursorColor: Colors
                                                            .white,
                                                        cursorHeight: 25,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                        style: GoogleFonts.getFont(
                                                            "Noto Sans Arabic",
                                                            textStyle: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .white))))
                                              ],
                                            ),
                                            Text(' :عنوان الخطة',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.getFont(
                                                    "Noto Sans Arabic",
                                                    fontSize: 27,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    textStyle: const TextStyle(
                                                        color: Color(
                                                            0xFFD0CDEF)))),
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 75,
                                                ),
                                                Container(
                                                  width: 170,
                                                  height: 50,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: ShapeDecoration(
                                                    color: Color.fromARGB(
                                                        151, 53, 45, 104),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 150.0,
                                                    child: TextField(
                                                        onChanged: (value) {
                                                          setState(() {
                                                            goal = value;
                                                            print("$goal");
                                                          });
                                                          //value is entered text after ENTER press
                                                          //you can also call any function here or make setState() to assign value to other variable
                                                        },
                                                        textAlign: TextAlign
                                                            .center,
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        cursorColor: Colors
                                                            .white,
                                                        cursorHeight: 25,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                        //  textAlign: TextAlign.right,

                                                        style: TextStyle(fontFamily: "Noto Sans Arabic", fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
                                                        keyboardType: TextInputType.number,
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ])

                                                    //                                             TextFormField(
                                                    //                                               textAlign: TextAlign.center,
                                                    //                                               textDirection: TextDirection.rtl,
                                                    //                                               cursorColor: Colors.white,
                                                    //                                               cursorHeight: 25,
                                                    //                                               decoration: InputDecoration(
                                                    // border:InputBorder.none),

                                                    //                                               style:GoogleFonts.getFont(
                                                    //                                                 "Noto Sans Arabic", textStyle: TextStyle(fontSize:25, fontWeight: FontWeight.w400, color: Colors.white))),

                                                    )
                                              ],
                                            ),
                                            Text(' : المبلغ الإدخاري',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.getFont(
                                                    "Noto Sans Arabic",
                                                    fontSize: 27,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    textStyle: const TextStyle(
                                                        color: Color(
                                                            0xFFD0CDEF)))),
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 75,
                                                  ),
                                                  Container(
                                                    width: 200,
                                                    height: 50,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: ShapeDecoration(
                                                      color: Color.fromARGB(
                                                          151, 53, 45, 104),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                  ),

                                                  //here
                                                  SizedBox(
                                                    width: 200.0,
                                                    height: 90,
                                                    child: TextButton(
                                                        child: Text('$date',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts.getFont(
                                                                "Noto Sans Arabic",
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: 1.5,
                                                                textStyle: const TextStyle(
                                                                    color: Color(
                                                                        0xFFD0CDEF)))),
                                                        onPressed: () {
                                                          showdatepicker(
                                                              context)(
                                                            initialDate:
                                                                DateTime.now(),
                                                            minDate: DateTime(
                                                                2021, 1, 1),
                                                            maxDate: DateTime(
                                                                2023, 12, 31),
                                                            onDateChanged:
                                                                (value) {
                                                              // Handle selected date
                                                            },
                                                          );
                                                        }),
                                                  )
                                                ]),
                                            Text(' :بداية الإدخار ',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.getFont(
                                                    "Noto Sans Arabic",
                                                    fontSize: 27,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    textStyle: const TextStyle(
                                                        color: Color(
                                                            0xFFD0CDEF)))),
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 75,
                                                ),
                                                Container(
                                                  width: 200,
                                                  height: 50,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: ShapeDecoration(
                                                    color: Color.fromARGB(
                                                        151, 53, 45, 104),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 200.0,
                                                  height: 90,
                                                  child: TextButton(
                                                      child: Text('$date2',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts.getFont(
                                                              "Noto Sans Arabic",
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1.5,
                                                              textStyle: const TextStyle(
                                                                  color: Color(
                                                                      0xFFD0CDEF)))),
                                                      onPressed: () {
                                                        showdatepicker2(
                                                            context)(
                                                          initialDate:
                                                              DateTime.now(),
                                                          minDate: DateTime(
                                                              2021, 1, 1),
                                                          maxDate: DateTime(
                                                              2023, 12, 31),
                                                          onDateChanged:
                                                              (value) {
                                                            // Handle selected date
                                                          },
                                                        );
                                                      }),
                                                )
                                              ],
                                            ),
                                            Text(' :نهاية الإدخار',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.getFont(
                                                    "Noto Sans Arabic",
                                                    fontSize: 27,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    textStyle: const TextStyle(
                                                        color: Color(
                                                            0xFFD0CDEF)))),
                                          ]),
                                      FloatingActionButton.extended(
                                          backgroundColor: Color(0xFF3A3462),
                                          label: Text(' إضافة خطة إدخار',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.getFont(
                                                  "Noto Sans Arabic",
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  textStyle: const TextStyle(
                                                      color:
                                                          Color(0xFFD0CDEF)))),
                                          onPressed: () async {
                                            // if (date == "انقر لتحديد التاريخ") {
                                            //   showDialog(
                                            //     context: context,
                                            //     builder: (context) {
                                            //       return AlertDialog(
                                            //         title: Text('تنبيه'),
                                            //         content: Text(
                                            //             'الرجاء تحديد التاريخ'),
                                            //         actions: [
                                            //           TextButton(
                                            //             onPressed: () {
                                            //               Navigator.of(context)
                                            //                   .pop();
                                            //             },
                                            //             child: Text('موافق'),
                                            //           ),
                                            //         ],
                                            //       );
                                            //     },
                                            //   );
                                            // } else {

                                            await supabaseClient
                                                .from('savingPlan')
                                                .insert({
                                              'startDate': date,
                                              'endDate': date2,
                                              'goal': goal,
                                              'goalName': goalName
                                            });
                                          })
                                    ]);
                              },
                            );
                          })
                    ],
                  ),
                ]),
              );
            }));
  }
}
