import 'package:flutter/material.dart';
import 'package:namaagp/ViewExpenses/ExpenseComponent.dart';
import 'package:namaagp/ViewExpenses/ExpensesHeader.dart';
import 'package:namaagp/ViewExpenses/ViewModelViewExpenses.dart';
import 'package:stacked/stacked.dart';
class ViewViewExpenses extends StatefulWidget {
  const ViewViewExpenses({
    super.key,
    // this.color = const Color(0xFFFFE306),
    // this.child,
  });

  // final Color color;
  // final Widget? child;

  @override
  State<ViewViewExpenses> createState() => ViewViewExpensesState();
}

class ViewViewExpensesState extends State<ViewViewExpenses> {
  //const ViewViewExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelViewExpenses>.reactive(
        viewModelBuilder: () => ViewModelViewExpenses(),
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
                    const ExpensesHeader(),
                    Container(
                          //margin: const EdgeInsets.all(5),
                          width: 400,
                          margin: EdgeInsets.only(bottom: 7),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.5,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFF9D9AC2),
                              ),
                            ),
                          ),
                        ),

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
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(children: [
                              index!=0?
                              Container(
                          margin: const EdgeInsets.all(10),
                          width: 310,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.5,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFF9D9AC2),
                              ),
                            ),
                          ),
                        ):SizedBox(),
                              Padding(
                          padding: const EdgeInsets.only(left: 13, right: 13),
                          child: Expense(
                              category: expenses[index]['category'],
                              date: expenses[index]['date'],
                              price: expenses[index]['price'].toString()),
                        ),
                        
                            ]),
                          );
                       },);
                   



                })



                    //Balance Area

                    //End of Balance Area





                    //Choose Chart Area

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
                )
              ));
        });
  }
}
