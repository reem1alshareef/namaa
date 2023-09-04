import 'package:flutter/material.dart';

class header extends StatelessWidget {
  //final String title;
  //final String subTitle;

  const header({
    Key? key,
    //required this.title,
    //required this.subTitle,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
    width: 389,
    height: 72.62,
    child: Stack(
        children: [
            Positioned(
                left: 289,
                top: 0,
                child: Container(
                    width: 100,
                    height: 72.62,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/100x73"),
                            fit: BoxFit.fill,
                        ),
                    ),
                ),
            ),
            const Positioned(
                left: 201,
                top: 6,
                child: SizedBox(
                    width: 144,
                    height: 45,
                    child: Text(
                        'نماء',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Trade Winds',
                            fontWeight: FontWeight.w400,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 35,
                top: 36,
                child: SizedBox(
                    width: 257,
                    height: 30,
                    child: Text(
                        'امتلك زمام التحكم بمعاملاتك المالية',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7400000095367432),
                            fontSize: 15,
                            fontFamily: 'Trade Winds',
                            fontWeight: FontWeight.w400,
                        ),
                    ),
                ),
            ),
            Positioned(
                left: 0,
                top: 16,
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/40x40"),
                            fit: BoxFit.fill,
                        ),
                    ),
                ),
            ),
        ],
    ),
)
      ],
    );
  }
}
