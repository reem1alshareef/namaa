import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/AddPlan/ViewModelAddPlan.dart';
import 'package:namaagp/Components/CustomButton.dart';
import 'package:namaagp/AddExpenses/speech_header.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:stacked/stacked.dart';

class ViewAddPlan extends StatefulWidget {
  ViewAddPlan({super.key});
  @override
  State<ViewAddPlan> createState() => _ViewAddPlanState();
}

int saved = 900;



class _ViewAddPlanState extends State<ViewAddPlan> {
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelAddPlan>.reactive(
        viewModelBuilder: () => ViewModelAddPlan(),
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
              child: Column(
                children: [
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
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
              ),),
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
                  // Text('خطط الادخار',
                  //     style: GoogleFonts.getFont("Noto Sans Arabic",
                  //         fontSize: 19,
                  //         fontWeight: FontWeight.w400,
                  //         height: 1.5,
                  //         textStyle: const TextStyle(color: Color(0xFFC5C5CD)))),
                  Expanded(
                    child: ListView.builder(
                      
                      padding: const EdgeInsets.all(16),
                      itemCount: 5,
                      itemBuilder: (context, i) {
                        return Container(
                          height: 130,
                        
                          child: Card(
                                           color: Color.fromARGB(101, 58, 52, 98),
                           elevation: 10,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(30.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 75.0,
                                      height: 50.0,
                                                                        child: Text('ادخار لسيارة',
                                                                         style: GoogleFonts.getFont("Noto Sans Arabic",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              textStyle: const TextStyle(
                                  color:Color(0xFFC5C5CD)))),
                                    ),
                                  ),
                                ),
                              
                                   Container(
                                    padding: EdgeInsets.all(30.0),
                                    child: Text(' 10-11-2023',  style: GoogleFonts.getFont("Noto Sans Arabic",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              textStyle: const TextStyle(
                                  color:Color(0xFFC5C5CD)))),
                                    // child: Chip(
                                    //   label: Text('@anonymous'),
                                    //   shadowColor: Colors.blue,
                                    //   backgroundColor: Colors.green,
                                    //   elevation: 10,
                                    //   autofocus: true,
                                    // )
                                  ),
                                
                              ],
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
                              textStyle:
                                  const TextStyle(color: Color(0xFFD0CDEF)))),
                      onPressed: () { showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    ListTile(
                                      //leading: new Icon(Icons.photo),
                                      title: new Text(''),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ]);
                            },
                          );})
                  
                ],
              ),
            ]),
          ));
        });
  }
}
