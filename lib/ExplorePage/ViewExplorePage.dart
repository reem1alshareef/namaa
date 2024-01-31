import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/ExplorePage/ChartsArea.dart';
import 'package:namaagp/ExplorePage/ExplorePageComponents/ExplorePageHeader.dart';
import 'package:namaagp/ExplorePage/ViewModelExplorePage.dart';
import 'package:namaagp/ViewExpenses/ExpenseComponent.dart';
import 'package:namaagp/ViewExpenses/ViewModelViewExpenses.dart';
import 'package:namaagp/addToBalance/ViewAddToBalance.dart';
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
                viewmodel.getCurrency(),
                viewmodel.getBalance()
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

                return Column(
                  children: [
                    // SizedBox(
                    //   height: 20,
                    // ),
                    ExplorePageHeader(),
                    SizedBox(
                      height: 2,
                    ),

                    //Balance Area
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Column(children: [
                      SizedBox(
                      width: 175,
                      height: 50,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: double.parse(userData[1]).floor().toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontFamily: 'Trade Winds',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                                text: userData[0],//' ر. س',
                                style: GoogleFonts.getFont("Noto Sans Arabic",
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
                              textStyle:
                                  const TextStyle(color: Color(0xFFA5A5B4)))),
                    ),
                    ],),
                    Positioned(
                          bottom: 60,
                          right: 20,
                          height: 30,
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewAddToBalance(),
                              ),
                            ),
                            child: Container(
                              child: Icon(
                                Icons.add,
                                size: 18,
                                color: Colors.white,
                              ),
                              width: 30,
                              height: 30,
                              decoration: ShapeDecoration(
                                color: Color.fromARGB(255, 194, 255, 210),
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
                        )
                    ],
                    ),
                    
                    //End of Balance Area

                    //Choose Chart Area
                    SizedBox(height: 260, width: 375, child: ChartsArea()),

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
                            style: GoogleFonts.getFont("Noto Sans Arabic",
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                //height: 1,
                                textStyle:
                                    const TextStyle(color: Colors.white))),
                      ],
                    ),
                    //End of Expenses Title

                    //Expenses

                    FutureBuilder<List<dynamic>>(future: ViewModelViewExpenses.getExpenses(), builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
         else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } 

                    List<dynamic> expenses = snapshot.data!;

                   
                    //height: 50,
                     
                       return ListView.builder(
                        padding: EdgeInsets.all(0),
                        //ali:,
                        scrollDirection: Axis.vertical,
                             shrinkWrap: true,
                        itemCount: snapshot.data!.length<3?snapshot.data!.length:3,//snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(children: [
                              index!=0?
                              Container(
                          margin: const EdgeInsets.all(5),
                          width: 310,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.25,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFF9D9AC2),
                              ),
                            ),
                          ),
                        ):SizedBox(),
                              Padding(
                          padding: const EdgeInsets.only(left: 13, right: 13),
                          child: 
                          Expense(
                              category: expenses[snapshot.data!.length-index-1]['category'],
                              date: expenses[snapshot.data!.length-index-1]['date'],
                              price: expenses[snapshot.data!.length-index-1]['price'].toString()),
                        ),
                        
                            ]),
                          );
                       },);
                   



                }),







                    // Padding(
                    //   padding: const EdgeInsets.only(left: 13, right: 13),
                    //   child: Expense(
                    //       category: 'شخصي',
                    //       date: '12 جولاي . 12:43',
                    //       price: '13 ريال سعودي'),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.all(5),
                    //   width: 310,
                    //   decoration: ShapeDecoration(
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(
                    //         width: 0.25,
                    //         strokeAlign: BorderSide.strokeAlignCenter,
                    //         color: Color(0xFF9D9AC2),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 13, right: 13),
                    //   child: Expense(
                    //       category: 'شخصي',
                    //       date: '12 جولاي . 12:43',
                    //       price: '13 ريال سعودي'),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.all(5),
                    //   width: 310,
                    //   decoration: ShapeDecoration(
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(
                    //         width: 0.25,
                    //         strokeAlign: BorderSide.strokeAlignCenter,
                    //         color: Color(0xFF9D9AC2),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 13, right: 13),
                    //   child: Expense(
                    //       category: 'شخصي',
                    //       date: '12 جولاي . 12:43',
                    //       price: '13 ريال سعودي'),
                    // ),




                  ],
                );
              });
        });
  }
}

void addExpenses() {}