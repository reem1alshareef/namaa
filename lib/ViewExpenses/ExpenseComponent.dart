import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Expense extends StatelessWidget {
  final String category;
  final String date;
  final String price;

  Expense(
      {Key? key,
      required this.category,
      required this.date,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // Generated code for this Row Widget...
        Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.getFont("Noto Sans Arabic",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.1,
                      textStyle: const TextStyle(color: Color.fromARGB(255, 226, 226, 236)))),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(category,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.getFont("Noto Sans Arabic",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          textStyle:
                              const TextStyle(color: Color.fromARGB(255, 219, 219, 231)))),
                  Text(date,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.getFont("Noto Sans Arabic",
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          textStyle:
                              const TextStyle(color: Color(0xFFA5A5B4)))),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 5,),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: 43,
              height: 43,
              decoration: BoxDecoration(
                color: Color(0x259E92FF),
                //borderRadius: BorderRadius.circular(30),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF9E92FF),
                  width: 1,
                ),
              ),
              //child: ClipRRect(
                //borderRadius: BorderRadius.circular(8),
                child: new Image.asset(
                  getIconPath(category),
                  fit: BoxFit.fill,
                  width: 35,
                  height: 35,
                ),
              //),
            ),
          ],
        ),
      ],
    );
  }

  String getIconPath(String category) {
    switch (category) {
      case 'house':
        return 'assets/CategoryICons/house.png';

      case 'foodAndDrinks':
        return 'assets/CategoryICons/foodAndDrinks.png';

      case 'entertaiment':
        return 'assets/CategoryICons/entertaiment.png';

      case 'health':
        return 'assets/CategoryICons/health.png';

      case 'شخصي':
        return 'assets/CategoryICons/personal.png';

      case 'transportation':
        return 'assets/CategoryICons/transportation.png';

      default:
        return 'assets/CategoryICons/other.png';
    }
  }
}
