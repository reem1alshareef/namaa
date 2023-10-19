import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/AddExpenses/speech_header.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Speech extends StatefulWidget {
  const Speech({super.key});

  @override
  State<Speech> createState() => _SpeechState();
}

class _SpeechState extends State<Speech> {
  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;
  String _wordsSpoken = "";
  double _confidenceLevel = 0;

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
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
      _confidenceLevel = result.confidence;
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
              Column(children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    _speechToText.isListening
                        ? "الرجاء التحدث بالصيغة التالية: \n صرفت عشرة ريال في يوم واحد ديسمبر فئة شخصي "
                        : _speechEnabled
                            ? "انقر الأيقونة لبدء التعرف الصوتي"
                            : "لايمكن الوصول للتعرف الصوتي",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      _wordsSpoken,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                //if (_speechToText.isNotListening && _confidenceLevel > 0)
                // Padding(
                //   padding: const EdgeInsets.only(
                //     bottom: 0,
                //   ),
                //   // child: Text(
                //   //   "Confidence: ${(_confidenceLevel * 100).toStringAsFixed(1)}%",
                //   //   style: TextStyle(
                //   //     fontSize: 30,
                //   //     fontWeight: FontWeight.w200,
                //   //   ),
                //   // ),
                // ),

                ElevatedButton(
                    onPressed: _speechToText.isListening
                        ? _stopListening
                        : _startListening,
                    child: Icon(
                      _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                      color: Color(0xFFC5C5CD),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 37, 37, 123)))
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
            ])));
  }

  // return Scaffold(

  //   body: Center(
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: EdgeInsets.all(16),
  //           child: Text(
  //             _speechToText.isListening
  //                 ? "الرجاء التحدث بالصيغة التالية: \n صرفت عشرة ريال في يوم واحد ديسمبر فئة شخصي "
  //                 : _speechEnabled
  //                     ? "انقر الأيقونة لبدء التعرف الصوتي"
  //                     : "لايمكن الوصول للتعرف الصوتي",
  //             style: TextStyle(fontSize: 20.0),
  //           ),
  //         ),
  //         Expanded(
  //           child: Container(
  //             padding: EdgeInsets.all(16),
  //             child: Text(
  //               _wordsSpoken,
  //               style: const TextStyle(
  //                 fontSize: 25,
  //                 fontWeight: FontWeight.w300,
  //               ),
  //             ),
  //           ),
  //         ),
  //         if (_speechToText.isNotListening && _confidenceLevel > 0)
  //           Padding(
  //             padding: const EdgeInsets.only(
  //               bottom: 100,
  //             ),
  //             // child: Text(
  //             //   "Confidence: ${(_confidenceLevel * 100).toStringAsFixed(1)}%",
  //             //   style: TextStyle(
  //             //     fontSize: 30,
  //             //     fontWeight: FontWeight.w200,
  //             //   ),
  //             // ),
  //           )
  //       ],
  //     ),
  //   ),
  //   floatingActionButton: FloatingActionButton(
  //     onPressed: _speechToText.isListening ? _stopListening : _startListening,
  //     tooltip: 'Listen',
  //     child: Icon(
  //       _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
  //       color: Colors.white,
  //     ),
  //     backgroundColor: Colors.red,
  //   ),
  // );
}
