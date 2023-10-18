import 'MoreExpensesComponents/ViewMoreExpensesHeader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namaagp/AddExpenses/ViewModelAddExpenses.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/cupertino.dart';

class ViewMoreExpenses extends StatefulWidget {
  ViewMoreExpenses({super.key});

  @override
  State<ViewMoreExpenses> createState() => _ViewMoreExpensesState();
}

class _ViewMoreExpensesState extends State<ViewMoreExpenses> {
  final TextEditingController _searchController = TextEditingController();
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelAddExpenses>.reactive(
        viewModelBuilder: () => ViewModelAddExpenses(),
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
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  ViewMoreExpensesHeader(),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('جميع المصروفات',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont("Noto Sans Arabic",
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              textStyle:
                                  const TextStyle(color: Color(0xFFD0CDEF)))),
                    ],
                  ),
//الخط
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 20),
                  //   width: 401,
                  //   height: 0.5,
                  //   decoration: BoxDecoration(
                  //     color: Color.fromARGB(132, 217, 217, 217),
                  //   ),
                  // ),
                  Row(children: [
                    TextButton(
                        onPressed: () async {
                          showModalBottomSheet(
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
                          );
                        },
                        child: Image.asset("assets/Icons/filter-4.png",
                            height: 20, width: 20)),
                    Text('تخصيص',
                        style: GoogleFonts.getFont("Noto Sans Arabic",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            textStyle:
                                const TextStyle(color: Color(0xFF93B2E4)))),
                  ]),
                ]),

                //Padding
                //              Positioned(
                // left: 326,
                // top: 210,
                // child: Container(
                //   width: 23,
                //   height: 23,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: NetworkImage("https://via.placeholder.com/23x23"),
                //       fit: BoxFit.fill,
                //     ),
                //   )
                // )
                //              )
              ));
        });

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
  }
}
