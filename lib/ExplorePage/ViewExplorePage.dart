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
          return Scaffold(
              backgroundColor: Color(0x00071121),
              body: Container(
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
                  // ignore: prefer_const_constructors
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ExplorePageHeader(),
                      SizedBox(
                        height: 10,
                      ),

                      //Balance Area
                      SizedBox(
                        width: 175,
                        height: 60,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '٨٠٠',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 44,
                                  fontFamily: 'Trade Winds',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                  text: ' ر. س',
                                  style: GoogleFonts.getFont("Noto Sans Arabic",
                                      fontSize: 30,
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
                        height: 30,
                        child: Text('الرصيد الكلي',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont("Noto Sans Arabic",
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.1,
                                textStyle:
                                    const TextStyle(color: Color(0xFFA5A5B4)))),
                      ),
                      //End of Balance Area

                      //Choose Chart Area
                      SizedBox(
                          height: 290, width: 375, child: ChartsArea()),

                      //End of Choose Chart Area

                      //Expenses Over Time Chart

                      //End of Expenses over Time Chart

                      //Expenses Title

                      //End of Expenses Title

                      //Expenses

                      //End of Expenses

                      //View more expenses

                      //End of View more expenses

                      //Chatbot button

                      //End of Chatbot button

                      //Navbar

                      //End of navbar
                    ],
                  )));
        });
  }
}
