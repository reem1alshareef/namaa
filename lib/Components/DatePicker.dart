import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DatePicker extends StatefulWidget {
  late TextEditingController currency;
  DatePicker({super.key, required this.currency});

  @override
  State<DatePicker> createState() => DatePickerClass();
}

class DatePickerClass extends State<DatePicker> {
  static const List<String> list = <String>[
    'ريال سعودي',
    'يورو',
    'دولار أمريكي',
    'جنية إسترليني',
    'درهم إماراتي'
  ];
  //static const List<String> list = <String>['ddd','dddddddddddddddddd'];
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 350,
          height: 40,
          child: Text('يوم الراتب',
              textAlign: TextAlign.right,
              style: GoogleFonts.getFont("Noto Sans Arabic",
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  textStyle: const TextStyle(color: Color(0xFFC5C5CD)))),
        ),
        SizedBox(
            width: 350,
            height: 55,
            child: CupertinoTheme(
              data: const CupertinoThemeData(//applyThemeToAll: ,
              brightness: Brightness.dark,
              textTheme: CupertinoTextThemeData(
                //pickerTextStyle: TextStyle(color: Color(0xffB59CCF))
                dateTimePickerTextStyle: TextStyle(
                      color: Color(0xffB59CCF),
                      fontSize: 18,
                      
                    ), 
              ), 
            ), child: CupertinoDatePicker(//backgroundColor: Color.fromRGBO(0, 0, 0, 1),
              //minimumDate: DateTime(2023),
              //minimumYear: 2023,
              //maximumDate: DateTime(2023, 11),
              //dateTime
              minimumDate: DateTime(2023, DateTime.january, 1),
              initialDateTime: DateTime(2023, DateTime.january, 1),
              maximumDate: DateTime(2023, DateTime.january, 31),
              showDayOfWeek: false,
              mode: CupertinoDatePickerMode.date,
              //minimumDate: DateTime(2023, 12),
              onDateTimeChanged: (DateTime value) {
                widget.currency.text = value.day.toString();
                print(widget.currency.text);
              },
              //mode: CupertinoDatePickerMode.date,
            ))
            ),
        // )),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
