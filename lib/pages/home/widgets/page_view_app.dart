import 'package:flutter/material.dart';
import 'card_app.dart';

class PageViewApp extends StatelessWidget {
  final double screenHeight;
  final ValueChanged<int> onChangeCallback;

  const PageViewApp({Key key, this.screenHeight, this.onChangeCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenHeight * .25,
      height: screenHeight * 0.45,
      left: 0,
      right: 0,
      child: PageView(
        onPageChanged: onChangeCallback,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          CardApp(),
          CardApp(),
          CardApp(),
        ],
      ),
    );
  }
}
