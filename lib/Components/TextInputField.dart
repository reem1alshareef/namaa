import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String title;
  final String placeHolder;

  const TextInputField({
    Key? key,
    required this.title,
    required this.placeHolder,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: 374,
    height: 93,
    child: Stack(
        children: [
            Positioned(
                left: 301,
                top: 0,
                child: SizedBox(
                    width: 73,
                    height: 59,
                    child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 16,
                            fontFamily: 'Trade Winds',
                            fontWeight: FontWeight.w400,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 260,
                top: 34,
                child: SizedBox(
                    width: 108,
                    height: 59,
                    child: Text(
                        placeHolder,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                            fontFamily: 'Trade Winds',
                            fontWeight: FontWeight.w400,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 0,
                top: 34,
                child: Container(
                    width: 357,
                    height: 45,
                    decoration: BoxDecoration(
                        color: const Color(0x00D9D9D9),
                        border: Border(
                            left: BorderSide(
                                color: Colors.white.withOpacity(0.699999988079071),
                            ),
                            top: BorderSide(
                                color: Colors.white.withOpacity(0.699999988079071),
                            ),
                            right: BorderSide(
                                color: Colors.white.withOpacity(0.699999988079071),
                            ),
                            bottom: BorderSide(
                                width: 0.62,
                                color: Colors.white.withOpacity(0.699999988079071),
                            ),
                        ),
                    ),
                ),
            ),
        ],
    ),
);
  }
}
