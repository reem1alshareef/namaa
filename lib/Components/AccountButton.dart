import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String title;
  final String placeHolder;

  const AccountButton({
    Key? key,
    required this.title,
    required this.placeHolder,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: 323,
    height: 55,
    child: Stack(
        children: [
            Positioned(
                left: 0,
                top: 0,
                child: Container(
                    width: 323,
                    height: 55,
                    decoration: ShapeDecoration(
                        color: const Color(0xFF3A3462),
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
            ),
            const Positioned(
                left: 79,
                top: 5,
                child: SizedBox(
                    width: 166,
                    height: 45,
                    child: Text(
                        'إنشاء حساب',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFFF8F8FF),
                            fontSize: 24,
                            fontFamily: 'Trade Winds',
                            fontWeight: FontWeight.w400,
                        ),
                    ),
                ),
            ),
        ],
    ),
);
  }
}
