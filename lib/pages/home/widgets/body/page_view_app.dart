import 'package:flutter/material.dart';
import 'package:hubank/pages/home/widgets/cards/card_app.dart';
import 'package:hubank/pages/home/widgets/cards/count_card.dart';
import 'package:hubank/pages/home/widgets/cards/info_card.dart';
import 'package:hubank/pages/home/widgets/cards/reward_card.dart';

class PageViewApp extends StatefulWidget {
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
  _PageViewAppState createState() => _PageViewAppState();
}

class _PageViewAppState extends State<PageViewApp> {
  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 0);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: _tween,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutExpo,
        builder: (context, value, child) {
          return AnimatedPositioned(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeOut,
            top: widget.screenHeight,
            height: 330,
            left: value,
            right: value * -1,
            child: GestureDetector(
              onPanUpdate: widget.onPanUpdate,
              child: PageView(
                onPageChanged: widget.onChangeCallback,
                physics: widget.showMenu
                    ? NeverScrollableScrollPhysics()
                    : BouncingScrollPhysics(),
                children: <Widget>[
                  CardApp(child: InfoCard()),
                  CardApp(child: CountCard()),
                  CardApp(child: RewardCard()),
                ],
              ),
            ),
          );
        });
  }
}
