import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/Splash/SplashCompenents/DraggableButton.dart';
import 'package:stacked/stacked.dart';

import 'ViewModelSplash.dart';

class ViewSplash extends StatelessWidget {
  const ViewSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModelSplash>.reactive(
        viewModelBuilder: () => ViewModelSplash(),
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
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'امتلك زمام التحكم\nبمعاملاتك المالية اليوم',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.getFont("Noto Sans Arabic",
                            color: const Color(0xFFD0CDEF),
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            const SizedBox(width: 55),
                            Image.asset(
                              'assets/NamaaLogo.png',
                              width: 250,
                              height: 184.14,
                              fit: BoxFit.fill,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 110,
                      child: Text('نماء',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont("Noto Sans Arabic",
                              fontSize: 64,
                              fontWeight: FontWeight.w400,
                              textStyle:
                                  const TextStyle(color: Color(0xFF958EC8)))),
                    ),
                    //const SizedBox(height: 30),
                    Text(
                      'يمكنك من خلال تطبيقنا، وبكل سهولة، أن تقوم بتتبُّع إيراداتك ومصروفاتك.\n\nحدِّد أهدافك المالية، \nواتخذ قرارات صائبة مبينة على معلومات موثقة عن أموالك.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont("Noto Sans Arabic",
                          color: const Color(0xB2D0CDEF),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          height: 1.5),
                    ),

                    const SizedBox(height: 30),

                    Stack(children: [
                      Container(
                        width: 323,
                        height: 58,
                        //margin: EdgeInsets.all(0),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF2D314D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                      const DraggableButton(),
                      // Positioned(
                      //     left: 268,
                      //     top: 5,
                      //     child: Container(
                      //       width: 49,
                      //       height: 49,
                      //       decoration: const ShapeDecoration(
                      //           color: Color(0xFF414472),
                      //           shape: OvalBorder(),
                      //           image: const DecorationImage(
                      //             image: AssetImage(
                      //               'assets/Icons/WhiteArrow.png',
                      //             ),
                      //             //fit: BoxFit.cover
                      //           )),
                      //     ))

                      
                    ])
                  ],
                ),
              ));
        });
  }
}