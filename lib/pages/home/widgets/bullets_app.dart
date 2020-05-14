import 'package:flutter/material.dart';

class BulletsApp extends StatelessWidget {
  final double screenHeight;
  final int currentIndex;

  const BulletsApp({Key key, this.screenHeight, this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenHeight * .70,
      child: Row(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColor(0),
            ),
          ),
          SizedBox(width: 8),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColor(1),
            ),
          ),
          SizedBox(width: 8),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColor(2),
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(int index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }
}
