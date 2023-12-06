import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/AddExpenses/ViewModelAddExpenses.dart';
import 'package:namaagp/AddExpenses/speech_header.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:namaagp/Components/CustomButton.dart';

class Speech extends StatefulWidget {
  const Speech({super.key});

  @override
  State<Speech> createState() => _SpeechState();
}

class _SpeechState extends State<Speech> {
  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;
  String _wordsSpoken = "";
  String category = '';
  String currency = '';
  String date = '';
  int amount = 0;
  String day = '';
  String dateM = '';

  isDay() {
    if (_wordsSpoken.contains(RegExp(r'[0-9]'))) {
      String str = _wordsSpoken;
      String start = "يوم";
      String end = dateM;

      final startIndex = str.indexOf(start);
      final endIndex = str.indexOf(end, startIndex + start.length);

      day = str.substring(startIndex + start.length, endIndex);
      print(day);
      return true;
    } else {
      return false;
    }
  }

  isAmount() {
    if (_wordsSpoken.contains(RegExp(r'[0-9]'))) {
      String str = _wordsSpoken;
      const start = "صرفت";
      String end = currency;

      final startIndex = str.indexOf(start);
      final endIndex = str.indexOf(end, startIndex + start.length);

      String t = str.substring(startIndex + start.length, endIndex);
      amount = int.parse(t);
      print(t);
      return true;
    } else {
      return false;
    }
  }

  isCategoryPersonal() {
    if (_wordsSpoken.contains('شخصي')) {
      category = 'شخصي';
      return true;
    } else {
      return false;
    }
  }

  isCategoryTranspotation() {
    if (_wordsSpoken.contains(('مواصلات'))) {
      category = 'مواصلات';
      return true;
    } else
      return false;
  }

  isCategoryHome() {
    if (_wordsSpoken.contains(('المنزل'))) {
      category = 'المنزل';
      return true;
    } else
      return false;
  }

  isCategoryFood() {
    if (_wordsSpoken.contains(('غذاء'))) {
      category = 'غذاء';
      return true;
    } else
      return false;
  }

  isCategoryHealth() {
    if (_wordsSpoken.contains(('صحة'))) {
      category = 'صحة';
      return true;
    } else
      return false;
  }

  isCategoryEntertainment() {
    if (_wordsSpoken.contains(('ترفيه'))) {
      category = 'ترفيه';
      return true;
    } else
      return false;
  }

  isCategoryOther() {
    if (_wordsSpoken.contains(('أخرى'))) {
      category = 'أخرى';
      return true;
    } else
      return false;
  }

  isCurrencySR() {
    if (_wordsSpoken.contains('ريال')) {
      currency = 'ريال';
      return true;
    } else
      return false;
  }

  isCurrencyUS() {
    if (_wordsSpoken.contains('دولار')) {
      currency = 'دولار';
      return true;
    } else
      return false;
  }

  isCurrencyAED() {
    if (_wordsSpoken.contains('درهم')) {
      currency = 'درهم';
      return true;
    } else
      return false;
  }

  isCurrencyEUO() {
    if (_wordsSpoken.contains('يورو')) {
      currency = 'يورو';
      return true;
    } else
      return false;
  }

  isCurrencyGBP() {
    if (_wordsSpoken.contains('جنية')) {
      currency = 'جنية';
      return true;
    } else
      return false;
  }

  isMonth1() {
    if (_wordsSpoken.contains(('يناير'))) {
      date = '1';
      return true;
    } else
      return false;
  }

  isMonth2() {
    if (_wordsSpoken.contains(('فبراير'))) {
      date = '2';
      return true;
    } else
      return false;
  }

  isMonth3() {
    if (_wordsSpoken.contains(('مارس'))) {
      date = '3';
      return true;
    } else
      return false;
  }

  isMonth4() {
    if (_wordsSpoken.contains(('أبريل')) || _wordsSpoken.contains('ابريل')) {
      date = '4';
      return true;
    } else
      return false;
  }

  isMonth5() {
    if (_wordsSpoken.contains(('مايو'))) {
      dateM = 'مايو';
      date = '5';
      return true;
    } else
      return false;
  }

  isMonth6() {
    if (_wordsSpoken.contains(('يونيو'))) {
      date = '6';
      return true;
    } else
      return false;
  }

  isMonth7() {
    if (_wordsSpoken.contains(('يوليو'))) {
      date = '7';
      return true;
    } else
      return false;
  }

  isMonth8() {
    if (_wordsSpoken.contains(('أغسطس')) || _wordsSpoken.contains('اغسطس')) {
      date = '8';
      return true;
    } else
      return false;
  }

  isMonth9() {
    if (_wordsSpoken.contains(('سبتمبر'))) {
      date = '9';
      return true;
    } else
      return false;
  }

  isMonth10() {
    if (_wordsSpoken.contains(('أكتوبر')) || _wordsSpoken.contains('اكتوبر')) {
      date = '10';
      return true;
    } else
      return false;
  }

  isMonth11() {
    if (_wordsSpoken.contains(('نوفمبر'))) {
      date = '11';
      return true;
    } else
      return false;
  }

  isMonth12() {
    if (_wordsSpoken.contains(('ديسمبر'))) {
      dateM = 'ديسمبر';
      date = '12';
      return true;
    } else
      return false;
  }

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
    });
  }

  @override
  Widget build(BuildContext context) {
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
            colors: [Color(0xFF342D68), Color(0xFF352D68), Color(0x00352D68)],
          ),
        ),
        // ignore: prefer_const_constructors
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
                Text('الادخال الصوتي ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont("Noto Sans Arabic",
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        textStyle: const TextStyle(color: Color(0xFFD0CDEF)))),
              ],
            ),
// الخط
            Container(
              margin: EdgeInsets.only(top: 7),
              width: 401,
              height: 0.5,
              decoration: BoxDecoration(
                color: Color.fromARGB(132, 217, 217, 217),
              ),
            ),
            Expanded(
              child: Column(children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    _speechToText.isListening
                        ? ":الرجاء التحدث بالصيغة التالية \n صرفت عشرة ريال في يوم واحد ديسمبر فئة مواصلات"
                        : _speechEnabled
                            ? " انقر الأيقونة لبدء الادخال الصوتي \n \n "
                            : "لايمكن الوصول للتعرف الصوتي الرجاءالسماح للوصول",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont("Noto Sans Arabic",
                        fontSize: 20.0, color: Color(0xFFD0CDEF)),
                  ),
                ),

                AvatarGlow(
                  animate: _speechToText.isListening,
                  glowColor: Color(0xFFD0CDEF),
                  endRadius: 55.0,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 200),
                  child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                    backgroundColor: Color(0xFFD0CDEF),
                    onPressed: _speechToText.isListening
                        ? _stopListening
                        : _startListening,
                    child: Icon(
                      _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                      color: Color(0xFF342D68),
                    ),
                  ),
                ),

// SPOKEN WORDS HERE
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    _wordsSpoken,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      "Noto Sans Arabic",
                      color: const Color.fromARGB(119, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        isCategoryPersonal() ||
                                isCategoryTranspotation() ||
                                isCategoryOther() ||
                                isCategoryEntertainment() ||
                                isCategoryFood() ||
                                isCategoryHealth() ||
                                isCategoryHome()
                            ? ' $category '
                            : '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          "Noto Sans Arabic",
                          color: Color(0xFFD0CDEF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    Text(': الفئة',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          "Noto Sans Arabic",
                          color: Color(0xFFD0CDEF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
                // Text(
                //     isCategoryPersonal() ||
                //             isCategoryTranspotation() ||
                //             isCategoryOther() ||
                //             isCategoryEntertainment() ||
                //             isCategoryFood() ||
                //             isCategoryHealth() ||
                //             isCategoryHome()
                //         ? ' الفئة : $category '
                //         : '',
                //     textAlign: TextAlign.center,
                //     style: GoogleFonts.getFont(
                //       "Noto Sans Arabic",
                //       color: Color(0xFFD0CDEF),
                //       fontSize: 20,
                //       fontWeight: FontWeight.w500,
                //
                //
                //    )),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(isAmount() ? ' $amount ' : '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          "Noto Sans Arabic",
                          color: Color(0xFFD0CDEF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    Text(': المبلغ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          "Noto Sans Arabic",
                          color: Color(0xFFD0CDEF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        isCurrencyAED() ||
                                isCurrencyEUO() ||
                                isCurrencyGBP() ||
                                isCurrencySR() ||
                                isCurrencyUS()
                            ? '  $currency '
                            : '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          "Noto Sans Arabic",
                          color: Color(0xFFD0CDEF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    Text(': العملة ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          "Noto Sans Arabic",
                          color: Color(0xFFD0CDEF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
                // Text(
                //     isCurrencyAED() ||
                //             isCurrencyEUO() ||
                //             isCurrencyGBP() ||
                //             isCurrencySR() ||
                //             isCurrencyUS()
                //         ? ' العملة : $currency '
                //         : '',
                //     textAlign: TextAlign.center,
                //     style: GoogleFonts.getFont(
                //       "Noto Sans Arabic",
                //       color: Color(0xFFD0CDEF),
                //       fontSize: 20,
                //       fontWeight: FontWeight.w500,
                //     )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        isMonth1() && isDay() ||
                                isMonth2() && isDay() ||
                                isMonth3() && isDay() ||
                                isMonth4() && isDay() ||
                                isMonth5() && isDay() ||
                                isMonth6() && isDay() ||
                                isMonth7() && isDay() ||
                                isMonth8() && isDay() ||
                                isMonth9() && isDay() ||
                                isMonth10() && isDay() ||
                                isMonth11() && isDay() ||
                                isMonth12() && isDay()
                            ? '  2023 - $date - $day '
                            : '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          "Noto Sans Arabic",
                          color: Color(0xFFD0CDEF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    Text(': التاريخ ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          "Noto Sans Arabic",
                          color: Color(0xFFD0CDEF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
              ]),
            ),

            Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                    title: 'اضافة',
                    onPressed: () {
                      if (date == '' && day == '') {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('تنبيه'),
                              content: Text('الرجاء تحديد التاريخ'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('موافق'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      if (currency == '') {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('تنبيه'),
                              content: Text(' الرجاء اختيار العملة'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('موافق'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      if (category == '') {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('تنبيه'),
                              content: Text(' الرجاء تحديد فئة الصرف'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('موافق'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      if (amount == 0) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('تنبيه'),
                              content: Text('الرجاء تحديد مبلغ الصرف'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('موافق'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        ViewModelAddExpenses().addExpenses('2023-$date-$day',
                            currency, category, amount.toString());
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('تم حفظ البيانات بنجاح'),
                            );
                          },
                        ).then((value) {
                          setState(() {
                            // Reset the widget values to their initial values
                            date = '';
                            currency = 'العملة';

                            category = '';
                            amount = 0;
                          });
                        });
                      }
                    })),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      
    );
  }
}
