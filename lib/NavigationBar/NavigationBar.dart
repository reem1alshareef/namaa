import 'package:flutter/material.dart';
import 'package:namaagp/ExplorePage/ViewExplorePage.dart';
//import 'package:namaagp/a';

/// Flutter code sample for [NavigationBar].

//void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x00071121),
      floatingActionButton: FloatingActionButton(
        //floatingActionL,
        onPressed: addExpenses,
        tooltip: 'Increment',
        child: Container(
          //margin: EdgeInsets.only(right: 30),
          child: Icon(
            Icons.add,
            size: 40,
          ),
          width: 60,
          height: 60,
          decoration: ShapeDecoration(
            color: Color(0xFFC9C2FF),
            shape: OvalBorder(),
            shadows: [
              BoxShadow(
                color: Color(0xFFB0ACD5),
                blurRadius: 4,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
        ),
        backgroundColor: Colors
            .transparent, //splashColor: Color(0xFFC9C2FF),//decoration: sha
      ), //floatingActionButtonLocation: f,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 30, left: 90, right: 90),
        width: 221,
        height: 83,
        decoration: ShapeDecoration(
          color: Color(0xFF313947),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.white.withOpacity(0.15000000596046448),
            ),
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentPageIndex,
            onTap: onDestinationSelected,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: new Image.asset('assets/NavBarIcons/Explore.png'),
                activeIcon: Container(
                  child: new Image.asset('assets/NavBarIcons/Explore.png'),
                  width: 51,
                  height: 51,
                  decoration: ShapeDecoration(
                    color: Color(0xFF93B2E4),
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0xFF93B2E4),
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ), //,
                label: 'Home',
              ),
              BottomNavigationBarItem(icon: new Image.asset('assets/NavBarIcons/SavingPlan.png', fit: BoxFit.fill, width: 35, height: 35,),
                activeIcon: Container(
                  padding: EdgeInsets.all(5),
                  child: new Image.asset('assets/NavBarIcons/SavingPlan.png', fit: BoxFit.fill, width: 35, height: 35,),
                  width: 51,
                  height: 51,
                  decoration: ShapeDecoration(
                    color: Color(0xFF93B2E4),
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0xFF93B2E4),
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ), //,
                label: 'inbox',),
              BottomNavigationBarItem(icon: new Image.asset('assets/NavBarIcons/Chatbot.png', fit: BoxFit.fill, width: 35, height: 35,),
                activeIcon: Container(
                  padding: EdgeInsets.all(5),
                  child: new Image.asset('assets/NavBarIcons/Chatbot.png', fit: BoxFit.fill, width: 35, height: 35,),
                  width: 51,
                  height: 51,
                  decoration: ShapeDecoration(
                    color: Color(0xFF93B2E4),
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0xFF93B2E4),
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ), //,
                label: 'Profile',)
            ]),
      ),
      body: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 50.0, left: 10, right: 10),
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
            child: ViewExplorePage()),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
    );
  }

  onDestinationSelected(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
}