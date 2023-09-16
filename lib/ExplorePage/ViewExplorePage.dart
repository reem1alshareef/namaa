import 'package:flutter/material.dart';
import 'package:namaagp/ExplorePage/ViewModelExplorePage.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';
import 'package:stacked/stacked.dart';


class ViewExplorePage extends StatelessWidget {
  const ViewExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelExplorePage>.reactive(
        viewModelBuilder: () => ViewModelExplorePage(),
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
                    mainHeader(),

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
