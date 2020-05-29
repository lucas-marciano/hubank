import 'package:flutter/material.dart';
import 'package:hubank/pages/home/widgets/cards/card_app.dart';
import 'package:hubank/pages/home/widgets/cards/count_card.dart';
import 'package:hubank/pages/home/widgets/cards/info_card.dart';

class PageViewApp extends StatelessWidget {
  final double screenHeight;
  final ValueChanged<int> onChangeCallback;
  final GestureDragUpdateCallback onPanUpdate;
  final bool showMenu;

  const PageViewApp(
      {Key key,
      this.screenHeight,
      this.onChangeCallback,
      this.onPanUpdate,
      this.showMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeOut,
      top: screenHeight,
      height: 330,
      left: 0,
      right: 0,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        child: PageView(
          onPageChanged: onChangeCallback,
          physics: showMenu
              ? NeverScrollableScrollPhysics()
              : BouncingScrollPhysics(),
          children: <Widget>[
            CardApp(child: InfoCard()),
            CardApp(child: CountCard()),
            CardApp(child: InfoCard()),
          ],
        ),
      ),
    );
  }
}
