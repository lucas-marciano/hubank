import 'package:flutter/material.dart';
import 'package:hubank/pages/home/widgets/app_bar_dark.dart';
import 'package:hubank/pages/home/widgets/page_view_app.dart';

import 'widgets/bullets_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          AppBarDark(
            showMenu: _showMenu,
            onTapMenu: () {
              setState(() {
                _showMenu = !_showMenu;
              });
            },
          ),
          PageViewApp(
            screenHeight: _screenHeight,
            onChangeCallback: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          BulletsApp(
            screenHeight: _screenHeight,
            currentIndex: _currentIndex,
          ),
        ],
      ),
    );
  }
}
