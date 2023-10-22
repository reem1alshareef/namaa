import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/AddExpenses/speech_header.dart';
import 'package:speech_to_text/speech_to_text.dart';
// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:highlight_text/highlight_text.dart';
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
  isCategoryPersonal() {
    if (_wordsSpoken.contains('شخصي')) {
      category = 'شخصي';
      return true;
    } else
      return false;
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
                          textStyle:
                              const TextStyle(color: Color(0xFFD0CDEF)))),
                ],
              ),
// الخط
              Container(
                margin: EdgeInsets.only(top: 15),
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
                          ? ":الرجاء التحدث بالصيغة التالية \n صرفت عشرة ريال في يوم واحد ديسمبر فئة شخصي"
                          : _speechEnabled
                              ? "انقر الأيقونة لبدء الادخال الصوتي"
                              : "لايمكن الوصول للتعرف الصوتي",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont("Noto Sans Arabic",
                          fontSize: 20.0, color: Color(0xFFD0CDEF)),
                    ),
                  ),
                  // AvatarGlow(
                  //   animate: _speechToText.isListening,
                  //   glowColor: Color(0xFFD0CDEF),
                  //   endRadius: 75.0,
                  //   duration: const Duration(microseconds: 2000),
                  //   repeatPauseDuration: const Duration(milliseconds: 100),
                  //   repeat: true,
                  //   child:
                  FloatingActionButton(
                    backgroundColor: Color(0xFFD0CDEF),
                    onPressed: _speechToText.isListening
                        ? _stopListening
                        : _startListening,
                    child: Icon(
                      _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                      color: Color(0xFF342D68),
                    ),
                  ),
                  // ),

                  // Expanded(
                  //   child:

                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      _wordsSpoken,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        "Noto Sans Arabic",
                        color: const Color.fromARGB(119, 255, 255, 255),
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // ),

                  Text(
                      isCategoryPersonal() ||
                              isCategoryTranspotation() ||
                              isCategoryOther() ||
                              isCategoryEntertainment() ||
                              isCategoryFood() ||
                              isCategoryHealth() ||
                              isCategoryHome()
                          ? ' الفئة : $category '
                          : '',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        "Noto Sans Arabic",
                        color: Color(0xFFD0CDEF),
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      )),

                  Text(':المبلغ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        "Noto Sans Arabic",
                        color: Color(0xFFD0CDEF),
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      )),

                  Text(':العملة',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        "Noto Sans Arabic",
                        color: Color(0xFFD0CDEF),
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      )),
                  Text(':التاريخ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        "Noto Sans Arabic",
                        color: Color(0xFFD0CDEF),
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      )),

                  SizedBox(height: 50,),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                          title: 'اضافة',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('تم حفظ البيانات بنجاح'),
                                );
                              },
                            );
                          })),
                ]),
              ),
            ])));
  }
}
