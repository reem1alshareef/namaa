import 'package:flutter/material.dart';
import 'package:namaagp/SignUp/ViewSignUp.dart';
import 'package:namaagp/services/ChatGPTServices.dart';

class DraggableButton extends StatelessWidget {
  // final String title;
  // final String placeHolder;

  const DraggableButton({
    Key? key,
    // required this.title,
    // required this.placeHolder,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Positioned(
                          left: 268,
                          top: 5,
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                          
                          Draggable(axis: Axis.horizontal,
                          
                            feedback: Container(
                            width: 49,
                            height: 49,
                            decoration: const ShapeDecoration(
                                color: Color(0xFF414472),
                                shape: OvalBorder(),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/Icons/WhiteArrow.png',
                                  ),
                                  //fit: BoxFit.cover
                                )),

                                //child: GestureDetector(onHorizontalDragUpdate: function(),),
                          ),
                          childWhenDragging: Container(
                            width: 49,
                            height: 49,
                            decoration: const ShapeDecoration(
                                color: Color(0xFF2D314D),
                                shape: OvalBorder(),
                                ),

                                child: GestureDetector(onHorizontalDragUpdate: function(),),
                          ),
                          child: Container(
                            width: 49,
                            height: 49,
                            decoration: const ShapeDecoration(
                                color: Color(0xFF414472),
                                shape: OvalBorder(),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/Icons/WhiteArrow.png',
                                  ),
                                  //fit: BoxFit.cover
                                )),

                                

                                //child: GestureDetector(onHorizontalDragUpdate: function(),),
                          )
                          ,onDragEnd: (details) {
                            print('ffffffffffffffffffffffffffffffffffffffffffffffffffff');
                            ChatGPTServices.askQuestion;
                            //Navigator.pop(context, (route) =>ViewIncomeDetails());
                            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  ViewSignUp()),
  );
  //                           Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) =>  ViewSignUp()),
  // );
                          },),
                          
        // DragTarget<int>(
        //   builder: (
        //     BuildContext context,
        //     List<dynamic> accepted,
        //     List<dynamic> rejected,
        //   ) {
        //     return Container(
        //       height: 100.0,
        //       width: 100.0,
        //       color: Colors.cyan,
        //       child: Center(
        //         child: Text('Value is updated to: '),
        //       ),
        //     );
        //   },
        //   onAccept: (int data) {
        //     // setState(() {
        //     //   acceptedData += data;
        //     // });
        //   },
        // ),
                          
                          
                          ]),);
  }

  function(){

  }
  
  // function(BuildContext context) {
  //   Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) =>  ViewSignUp()),
  // );
  // }
}
