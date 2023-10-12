import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/Settings/ViewSettings.dart';

class ExplorePageHeader extends StatelessWidget {
  //final String title;
  //final String subTitle;

  const ExplorePageHeader({
    Key? key,
    //required this.title,
    //required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 5,),
        GestureDetector(
          child: Image.asset(
                    'assets/Icons/settingsIcon.png',
                    width: 40,
          height: 29, //228.33,
                    fit: BoxFit.cover,
                  ),
          onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>  ViewSettings()),);
          },
        ),
        //const ReturnToPreviousPage(title: 'البداية', tWidth: 69,),
        SizedBox(width: 35,),
        Column(
          children: [
            //Expanded(
              //child: 
             // SizedBox(
                //height: 40,
                //width: 50,
                //child: 
                
                Row(
                  children: [
                    SizedBox(width: 155,),
                    Text('نماء',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.getFont("Noto Sans Arabic",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1,
                                  textStyle: const TextStyle(color: Color(0xFFD0CDEF)))
                                  ),
                  ],
                ),
              //),
            //),
            Text('امتلك زمام التحكم بمعاملاتك المالية',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont("Noto Sans Arabic",
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          textStyle: const TextStyle(color: Color(0xFFC5C5D0)))),
          ],
        ),
        Container(
          width: 40,
          height: 29,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/NamaaLogo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 5,),

        

        //SizedBox(height: 200,),
//         SizedBox(
//     width: 389,
//     height: 72.62,
//     child: Stack(
//         children: [
//             Positioned(
//                 left: 289,
//                 top: 0,
//                 child: Column(children: [
//                   Container(
//                     width: 50,
//                     height: 36.31,
//                     decoration: const BoxDecoration(
//                         // image: DecorationImage(
//                         //     image: Image.asset("assets/NamaaLogo.png"),
//                         //     fit: BoxFit.fill,
//                         // ),
//                         image: DecorationImage(
//       image: const AssetImage('assets/NamaaLogo.png'),
//       fit: BoxFit.cover,
//     ),
//                     ),
//                     // child: Image.asset(
//                     //           'assets/NamaaLogo.png',
//                     //           width: 207.46,//310,
//                     //           height: 152.8,//228.33,
//                     //           fit: BoxFit.fill,
//                     //         ),
//                 )
//                 ],)
//                 //child: ,
//             ),
//             const Positioned(
//                 left: 201,
//                 top: 6,
//                 child: SizedBox(
//                     width: 144,
//                     height: 45,
//                     child: Text(
//                         'نماء',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 24,
//                             fontFamily: 'Trade Winds',
//                             fontWeight: FontWeight.w400,
//                         ),
//                     ),
//                 ),
//             ),
//             Positioned(
//                 left: 35,
//                 top: 36,
//                 child: SizedBox(
//                     width: 257,
//                     height: 30,
//                     child: Text(
//                         'امتلك زمام التحكم بمعاملاتك المالية',
//                         textAlign: TextAlign.right,
//                         style: TextStyle(
//                             color: Colors.white.withOpacity(0.7400000095367432),
//                             fontSize: 15,
//                             fontFamily: 'Trade Winds',
//                             fontWeight: FontWeight.w400,
//                         ),
//                     ),
//                 ),
//             ),
//             Positioned(
//                 left: 0,
//                 top: 16,
//                 child: Container(
//                     width: 40,
//                     height: 40,
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             image: NetworkImage("https://via.placeholder.com/40x40"),
//                             fit: BoxFit.fill,
//                         ),
//                     ),
//                 ),
//             ),
//         ],
//     ),
// )
      ],
    );
  }
}
