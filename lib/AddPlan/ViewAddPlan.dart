import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:namaagp/AddExpenses/speech_header.dart';
import 'ViewModelAddPlan.dart';
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
  String calc(String startDate_, String endDate_) {
    DateTime Date1 = DateTime.parse(startDate_);
    DateTime Date2 = DateTime.parse(endDate_);
    Duration diff = Date2.difference(Date1);
    return diff.inDays.toString();
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
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: savingPlan.length,
                      itemBuilder: (context, index) {
                        final item = savingPlan[index];

                        return Container(
                            key: UniqueKey(),
                            height: 120,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: Color.fromARGB(151, 53, 45, 104),
                                elevation: 10,
                                child: Column(children: <Widget>[
                                  Row(children: [
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Text('رس',
                                            style: GoogleFonts.getFont(
                                                "Noto Sans Arabic",
                                                fontSize: 22,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5,
                                                textStyle: const TextStyle(
                                                    color: Color(0xFFC5C5CD)))),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      // padding: EdgeInsets.all(5.0),
                                      child: Text(item['goal'].toString(),
                                          style: GoogleFonts.getFont(
                                              "Noto Sans Arabic",
                                              fontSize: 22,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5,
                                              textStyle: const TextStyle(
                                                  color: Color(0xFFC5C5CD)))),
                                    ),
                                    Container(
                                      width: 130.0,
                                      child: Text(item['goalName'],
                                          textAlign: TextAlign.right,
                                          style: GoogleFonts.getFont(
                                              "Noto Sans Arabic",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5,
                                              textStyle: const TextStyle(
                                                  color: Color(0xFFC5C5CD)))),
                                    ),
                                  ]),
                                  Row(children: [
                                    Text('    يوم ',
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.getFont(
                                            "Noto Sans Arabic",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            textStyle: const TextStyle(
                                                color: Color.fromARGB(
                                                    143, 197, 197, 205)))),
                                    Container(
                                        width: 25,
                                        child: Text(
                                            calc(item['startDate'],
                                                item['endDate']),
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.getFont(
                                                "Noto Sans Arabic",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5,
                                                textStyle: const TextStyle(
                                                    color: Color.fromARGB(
                                                        143, 197, 197, 205))))),
                                    Container(
                                        width: 174,
                                        child: Text(' :الفترة',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.getFont(
                                                "Noto Sans Arabic",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5,
                                                textStyle: const TextStyle(
                                                    color: Color.fromARGB(
                                                        143, 197, 197, 205))))),
                                    TextButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                    title: Text(
                                                        'حذف خطة الإدخار',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                    content: Text(
                                                        'هل أنت متأكد من حذف خطة الإدخار؟',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                    actions: [
                                                      ElevatedButton(
                                                        child: Text("إلغاء",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .getFont(
                                                              "Noto Sans Arabic",
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            )),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ElevatedButton(
                                                        child: Text("حذف",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .getFont(
                                                              "Noto Sans Arabic",
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            )),
                                                        onPressed: () {
                                                          ViewModelAddPlan()
                                                              .deletePlan();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      )
                                                    ],
                                                    actionsAlignment:
                                                        MainAxisAlignment
                                                            .center);
                                              });
                                        },
                                        child: Icon(Icons.delete)),
                                  ]),
                                ])));
                      },
                    ),
                  ),
                  Column(
                    children: [
                      FloatingActionButton.extended(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40.0),
                            ),
                          ),
                          backgroundColor: Color(0xFF3A3462),

                          //child: const Icon(Icons.add),
                          label: Text(' إضافة خطة جديدة',
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
                                  return StatefulBuilder(
                                    builder: (BuildContext context,
                                        StateSetter setModalState) {
                                      return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
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
                                              title: new Text('خطة إدخار جديدة',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.getFont(
                                                      "Noto Sans Arabic",
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.5,
                                                      textStyle: const TextStyle(
                                                          color: Color(
                                                              0xFFD0CDEF)))),
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
                                                        height: 43,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Color.fromARGB(
                                                              151, 53, 45, 104),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: 200.0,
                                                          child: TextFormField(
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  goalName =
                                                                      value;
                                                                  print(
                                                                      "$goalName");
                                                                });
                                                              },
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              textDirection:
                                                                  TextDirection
                                                                      .rtl,
                                                              cursorColor:
                                                                  Colors.white,
                                                              cursorHeight: 25,
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none),
                                                              style: GoogleFonts.getFont(
                                                                  "Noto Sans Arabic",
                                                                  textStyle: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .white))))
                                                    ],
                                                  ),
                                                  Text(' :عنوان الخطة',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5,
                                                          textStyle:
                                                              const TextStyle(
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
                                                        height: 45,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Color.fromARGB(
                                                              151, 53, 45, 104),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: 150.0,
                                                          child: TextField(
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  goal = value;
                                                                  print(
                                                                      "$goal");
                                                                });
                                                                //value is entered text after ENTER press
                                                                //you can also call any function here or make setState() to assign value to other variable
                                                              },
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              textDirection:
                                                                  TextDirection
                                                                      .rtl,
                                                              cursorColor:
                                                                  Colors.white,
                                                              cursorHeight: 25,
                                                              decoration:
                                                                  InputDecoration(
                                                                      border: InputBorder.none),
                                                              //  textAlign: TextAlign.right,

                                                              style: TextStyle(fontFamily: "Noto Sans Arabic", fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
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
                                                  Text(' : مبلغ الإدخار',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5,
                                                          textStyle:
                                                              const TextStyle(
                                                                  color: Color(
                                                                      0xFFD0CDEF)))),
                                                ]),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        SizedBox(
                                                          width: 75,
                                                        ),
                                                        Container(
                                                          width: 200,
                                                          height: 50,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          decoration:
                                                              ShapeDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    151,
                                                                    53,
                                                                    45,
                                                                    104),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                        ),

                                                        //here
                                                        SizedBox(
                                                          width: 200.0,
                                                          height: 57,
                                                          child: TextButton(
                                                              child: Text('$date',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: GoogleFonts.getFont(
                                                                      "Noto Sans Arabic",
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight: FontWeight
                                                                          .w400,
                                                                      height:
                                                                          1.5,
                                                                      textStyle: const TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              255,
                                                                              255)))),
                                                              onPressed: () {
                                                                setState(() {
                                                                  showdatepicker(
                                                                      context)(
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    minDate:
                                                                        DateTime(
                                                                            2021,
                                                                            1,
                                                                            1),
                                                                    maxDate:
                                                                        DateTime(
                                                                            2023,
                                                                            12,
                                                                            31),
                                                                    onDateChanged:
                                                                        (value) {
                                                                      // Handle selected date
                                                                    },
                                                                  );
                                                                });
                                                              }),
                                                        )
                                                      ]),
                                                  Text(' :بداية الإدخار ',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5,
                                                          textStyle:
                                                              const TextStyle(
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
                                                            const EdgeInsets
                                                                .all(10),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Color.fromARGB(
                                                              151, 53, 45, 104),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 200.0,
                                                        height: 55,
                                                        child: TextButton(
                                                            child: Text(
                                                                '$date2',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: GoogleFonts.getFont(
                                                                    "Noto Sans Arabic",
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 1.5,
                                                                    textStyle: const TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255)))),
                                                            onPressed: () {
                                                              showdatepicker2(
                                                                  context)(
                                                                initialDate:
                                                                    DateTime
                                                                        .now(),
                                                                minDate:
                                                                    DateTime(
                                                                        2021,
                                                                        1,
                                                                        1),
                                                                maxDate:
                                                                    DateTime(
                                                                        2023,
                                                                        12,
                                                                        31),
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
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.getFont(
                                                          "Noto Sans Arabic",
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5,
                                                          textStyle:
                                                              const TextStyle(
                                                                  color: Color(
                                                                      0xFFD0CDEF)))),
                                                ]),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            FloatingActionButton.extended(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(40.0),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    Color(0xFF3A3462),
                                                label: Text(' إضافة خطة إدخار',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.getFont(
                                                        "Noto Sans Arabic",
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.5,
                                                        textStyle: const TextStyle(
                                                            color: Color(
                                                                0xFFD0CDEF)))),
                                                onPressed: () {
                                                  ViewModelAddPlan().addPlan(
                                                    date,
                                                    date2,
                                                    goal,
                                                    goalName,
                                                  );
                                                  Navigator.pop(context);
                                                })
                                          ]);
                                    },
                                  );
                                });
                          }),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ]),
              );
            }));
  }
}
