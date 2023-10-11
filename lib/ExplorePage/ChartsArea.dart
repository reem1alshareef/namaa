import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/ExplorePage/MoneyTimeChart/ViewMoneyTimeChart.dart';
import 'package:namaagp/ExplorePage/currencyChart/ViewCurrencyChart.dart';
import 'categoryChart/viewCategoryChart.dart';

class ChartsArea extends StatefulWidget {
  const ChartsArea({
    Key? key,
  }) : super(key: key);

  @override
  State<ChartsArea> createState() => ChartsAreaClass();
}

class ChartsAreaClass extends State<ChartsArea> {
  final PageController controller1 = PageController(
    initialPage: 1,
    keepPage: true,
  );
  int bottomSelectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> buildBottomNavBarItems() {
      return [
        BottomNavigationBarItem(
          icon: Text(
            'فئة المصروفات',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              "Noto Sans Arabic",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textStyle: const TextStyle(color: Color(0xFFA5A5B5)),
            ),
          ),
          activeIcon: Text(
            'فئة المصروفات',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              "Noto Sans Arabic",
              fontSize: 15,
              fontWeight: FontWeight.w400,
              textStyle: const TextStyle(color: Colors.white),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Text(
            'قيمة المصروفات',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              "Noto Sans Arabic",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textStyle: const TextStyle(color: Color(0xFFA5A5B5)),
            ),
          ),
          activeIcon: Text(
            'قيمة المصروفات',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              "Noto Sans Arabic",
              fontSize: 15,
              fontWeight: FontWeight.w400,
              textStyle: const TextStyle(color: Colors.white),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Text(
            'العملات',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              "Noto Sans Arabic",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textStyle: const TextStyle(color: Color(0xFFA5A5B5)),
            ),
          ),
          activeIcon: Text(
            'العملات',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              "Noto Sans Arabic",
              fontSize: 15,
              fontWeight: FontWeight.w400,
              textStyle: const TextStyle(color: Colors.white),
            ),
          ),
          label: '',
        ),
      ];
    }

    return Column(
      children: [
        BottomNavigationBar(
          currentIndex: bottomSelectedIndex,
          onTap: (index) {
            bottomTapped(index);
          },
          selectedFontSize: 0,
          unselectedFontSize: 0,
          backgroundColor: Colors.black.withOpacity(0),
          elevation: 0,
          items: buildBottomNavBarItems(),
        ),
        Expanded(
          child: SizedBox(
            height: 180.0,
            child: PageView(
              onPageChanged: (index) {
                pageChanged(index);
              },
              scrollDirection: Axis.horizontal,
              controller: controller1,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xff292E45),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  width: 260,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -10, // Adjust the top value as needed
                        right: 0,
                        child: SizedBox(
                          width: 350,
                          height: 210,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: ViewCategoryChart(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 6, right: 6),
                  decoration: BoxDecoration(
                    color: Color(0xff292E45),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  width: 260,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: ViewMoneyTimeChart(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xff292E45),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  width: 260,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -10, // Adjust the top value as needed
                        right: 0,
                        child: SizedBox(
                          width: 350,
                          height: 210,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: ViewCurrencyChart(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      controller1.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }
}