import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/ExplorePage/ChartsArea.dart';
import 'package:namaagp/ExplorePage/ExplorePageComponents/ExplorePageHeader.dart';
import 'package:namaagp/ExplorePage/ViewModelExplorePage.dart';
import 'package:stacked/stacked.dart';

class ViewExplorePage extends StatelessWidget {
  const ViewExplorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelExplorePage>.reactive(
        viewModelBuilder: () => ViewModelExplorePage(),
        builder: (context, viewmodel, _) {
          //Future <String> currency;
          return FutureBuilder<List<String>>(
              future: Future.wait([
                // viewmodel.getCurrency(),
                // viewmodel.getBalance()
              ]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    padding: EdgeInsets.only(top: 50.0, left: 10, right: 10),
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
                  );
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                List<String> userData = snapshot.data!;

                return 
                // Scaffold(
                //     backgroundColor: Color(0x00071121),
                //     body: Container(
                //         padding:
                //             EdgeInsets.only(top: 50.0, left: 10, right: 10),
                //         width: 428,
                //         height: 926,
                //         clipBehavior: Clip.antiAlias,
                //         decoration: const BoxDecoration(
                //           //maybe delete const
                //           gradient: LinearGradient(
                //             begin: Alignment(-0.00, -6.00),
                //             end: Alignment(0, 1.5),
                //             colors: [
                //               Color(0xFF342D68),
                //               Color(0xFF352D68),
                //               Color(0x00352D68)
                //             ],
                //           ),
                //         ),
                        // ignore: prefer_const_constructors
                        //child: 
                        Column(
                          children: [
                            // SizedBox(
                            //   height: 20,
                            // ),
                            ExplorePageHeader(),
                            SizedBox(
                              height: 2,
                            ),

                            //Balance Area
                            SizedBox(
                              width: 175,
                              height: 50,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '', //userData[1],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontFamily: 'Trade Winds',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                        text: '', //userData[0],//' ر. س',
                                        style: GoogleFonts.getFont(
                                            "Noto Sans Arabic",
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1,
                                            textStyle: const TextStyle(
                                                color: Color(0xFFD0CDEF)))),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            SizedBox(
                              width: 175,
                              height: 20,
                              child: Text('الرصيد الكلي',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont("Noto Sans Arabic",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      height: 1.1,
                                      textStyle: const TextStyle(
                                          color: Color(0xFFA5A5B4)))),
                            ),
                            //End of Balance Area

                            //Choose Chart Area
                            SizedBox(
                                height: 280, width: 375, child: ChartsArea()),

                            //End of Choose Chart Area

                            //Expenses Title
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 220,
                                ),
                                Text('المصروفات',
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.getFont(
                                        "Noto Sans Arabic",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        //height: 1,
                                        textStyle: const TextStyle(
                                            color: Colors.white))),
                              ],
                            ),
                            //End of Expenses Title

                            //Expenses

                            //End of Expenses

                            //View more expenses

                            //End of View more expenses

                            //Chatbot button
                            //                 FloatingActionButton(
                            //   onPressed: addExpenses,
                            //   tooltip: 'Increment',
                            //   child: new Icon(Icons.add),
                            // ),
                            //End of Chatbot button

                            //Navbar

                            //End of navbar
                          ],
                        );//),
                    // floatingActionButton: FloatingActionButton(
                    //   onPressed: addExpenses,
                    //   tooltip: 'Increment',
                    //   child: Container(
                    //     child: Icon(
                    //       Icons.add,
                    //       size: 40,
                    //     ),
                    //     decoration: BoxDecoration(
                    //       color: Colors.transparent,
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(100),
                    //       ),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Color(0xFFB0ACD5),
                    //           spreadRadius: 0,
                    //           blurRadius: 25,
                    //           offset: Offset(0, 0),
                    //         ),
                    //       ],
                    //     ),
                    //   ), //new Icon(Icons.add),
                    //   backgroundColor: Color(
                    //       0xFFC9C2FF), //splashColor: Color(0xFFC9C2FF),//decoration: sha
                    // ),
//                     bottomNavigationBar: Container(margin: EdgeInsets.only(bottom: 30, left: 90, right: 90),
//                       width: 221,
// height: 83,
// decoration: ShapeDecoration(
// color: Color(0xFF313947),
// shape: RoundedRectangleBorder(
// side: BorderSide(
// width: 1,
// color: Colors.white.withOpacity(0.15000000596046448),
// ),
// borderRadius: BorderRadius.circular(60),
// ),
// ),
//                       child: BottomNavigationBar(
//                           backgroundColor: Colors.transparent,
//                           showSelectedLabels: false,
//                           showUnselectedLabels: false,
//                           type: BottomNavigationBarType.fixed,
//       elevation: 0,
//                           items: [
// BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         // BottomNavigationBarItem(
//         //     icon: Icon(Icons.local_activity), label: 'Activity'),
//         BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox'),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.person), label: 'Profile'),
//                           ]),
//                     )
                    // FloatingNavBar(
                    //   //horizontalPadding: 10,
                    //   items: [
                    //     FloatingNavBarItem(title: 'title', page: ViewSettings(), useImageIcon: true, icon: ImageIcon(AssetImage('assets\Icons\LightPurpleArrow.png'))),
                    //                             FloatingNavBarItem(title: 'title', page: ViewSettings(), useImageIcon: true, icon: ImageIcon(AssetImage('assets\Icons\LightPurpleArrow.png')))

                    //     //naviga
                    //   ],
                    //   color: Color(0xFF313947),
                    //   hapticFeedback: true,
                    //   showTitle: false,
                    //   borderRadius: 40,
                    //   cardWidth:221,
                    //   horizontalPadding: 48,
                    //   //decoration:DecoratedBox(shape: shape)
                    // )
                    //);
              });
        });
  }
}

void addExpenses() {}
