import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CurrencyDropdownList extends StatefulWidget {
  late TextEditingController currency;
  CurrencyDropdownList({super.key, required this.currency});

  @override
  State<CurrencyDropdownList> createState() => CurrencyDropdownListClass();
}

class CurrencyDropdownListClass extends State<CurrencyDropdownList> {
  static const List<String> list = <String>[
    'ريال سعودي',
    'يورو',
    'دولار أمريكي',
    'جنية إسترليني',
    'درهم إماراتي'
  ];
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 350,
          height: 20,
          child: Text('العملة',
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
            child: DropdownButtonFormField<String>(
              dropdownColor: Color(0xFFB8BAC2),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.keyboard_arrow_down_rounded,
                      color: Color(
                        0xFFB8BAC2,
                      )),
                  fillColor: Color(0xFFB8BAC2),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFB8BAC2)))),
              iconSize: 0,
              alignment: AlignmentDirectional.bottomEnd,
              value: dropdownValue,
              isExpanded: true,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple, height: 0),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                  widget.currency.text = value;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList(),
              selectedItemBuilder: (BuildContext context) => list
                  .map((e) => Center(
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ))
                  .toList(),
            )),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
