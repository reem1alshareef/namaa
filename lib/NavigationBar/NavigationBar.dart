import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  double navbarWidth=200;
  

  double returnImageIconSize(){
    return navbarWidth*35/221;
  }

  double returnImageContainerSize(){
    return navbarWidth*51/221;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0x00071121),
      // floatingActionButton: FloatingActionButton(
      //   //floatingActionL,
      //   onPressed: addExpenses,
      //   tooltip: 'Increment',
      //   child: Container(
      //     //margin: EdgeInsets.only(right: 30),
      //     child: Icon(
      //       Icons.add,
      //       size: 40,
      //     ),
      //     width: 60,
      //     height: 60,
      //     decoration: ShapeDecoration(
      //       color: Color(0xFFC9C2FF),
      //       shape: OvalBorder(),
      //       shadows: [
      //         BoxShadow(
      //           color: Color(0xFFB0ACD5),
      //           blurRadius: 4,
      //           offset: Offset(0, 0),
      //           spreadRadius: 0,
      //         )
      //       ],
      //     ),
      //   ),
      //   backgroundColor: Colors
      //       .transparent, //splashColor: Color(0xFFC9C2FF),//decoration: sha
      // ), //floatingActionButtonLocation: f,
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: currentPageIndex==0?130:100,
        child: Stack(
          fit: StackFit.loose,
          children: [
            
            Positioned(
              right: -7,
              //alignment:Alignment.center,
              bottom: 5,
              child: Container(
                margin: EdgeInsets.only(bottom: 0, left: 90, right: 90),
                width: navbarWidth,//221,
                height: 78.2,
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
                  //height:,
                    backgroundColor: Colors.transparent,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: currentPageIndex,
                    onTap: onDestinationSelected,
                    elevation: 0,
                    items: [
                      BottomNavigationBarItem(
                        icon: new Image.asset('assets/NavBarIcons/Explore.png', fit: BoxFit.fill, width: returnImageIconSize(), height: returnImageIconSize(),),
                        activeIcon: Container(
                                                    padding: EdgeInsets.all(8),
                                            margin: EdgeInsets.only(left: 7),
                          child: new Image.asset('assets/NavBarIcons/Explore.png', fit: BoxFit.fill, width: returnImageIconSize(), height: returnImageIconSize(),),
                          width: returnImageContainerSize(),//51,
                          height: returnImageContainerSize(),
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
                      BottomNavigationBarItem(icon: new Image.asset('assets/NavBarIcons/SavingPlan.png', fit: BoxFit.fill, width: returnImageIconSize(), height: returnImageIconSize(),),
                        activeIcon: Container(
                          padding: EdgeInsets.all(8),
                          child: new Image.asset('assets/NavBarIcons/SavingPlan.png', fit: BoxFit.fill, width: returnImageIconSize(), height: returnImageIconSize(),),
                          width: returnImageContainerSize(),
                          height: returnImageContainerSize(),
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
                        label: 'Saving Plan',),
                      BottomNavigationBarItem(icon: new Image.asset('assets/NavBarIcons/Chatbot.png', fit: BoxFit.fill, width: returnImageIconSize(), height: returnImageIconSize(),),
                        activeIcon: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(right: 7),
                          child: new Image.asset('assets/NavBarIcons/Chatbot.png', fit: BoxFit.fill, width: returnImageIconSize(), height: returnImageIconSize(),),
                          width: returnImageContainerSize(),
                          height: returnImageContainerSize(),
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
                        label: 'Chatbot',)
                    ]),
              ),
            ),
            currentPageIndex==0?
            Positioned(
              bottom: 60,
              right: 20,
              height: 60,
              child: GestureDetector(
                onTap: addExpenses,
                child: Container(
                //margin: EdgeInsets.only(right: 30),
                child: Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.white,
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
              ),
            ):SizedBox(width: 0,height: 0,),
            currentPageIndex==0?
            Positioned(
              left: 140,
              bottom: 90,
              child: Text(
              'عرض المزيد',
              textAlign: TextAlign.right,
              style: GoogleFonts.getFont("Noto Sans Arabic",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  textStyle: const TextStyle(color: Color(0xFF6FA8FF), decoration: TextDecoration.underline)),
                  
            )):SizedBox(width: 0,height: 0,)
          ],
        ),
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