import 'package:flutter/material.dart';
import 'package:hubank/pages/home/widgets/app_bar_dark.dart';
import 'package:hubank/pages/home/widgets/menu/menu_app.dart';
import 'package:hubank/pages/home/widgets/page_view_app.dart';

import 'widgets/bullets_app.dart';
import 'widgets/menu_bottom/bottom_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu;
  int _currentIndex;
  double _yPosition;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    if (_yPosition == null) _yPosition = _screenHeight * .25;

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
                _yPosition =
                    _showMenu ? _screenHeight * .80 : _screenHeight * .25;
              });
            },
          ),
          MenuApp(
            top: _screenHeight * .22,
            showMenu: _showMenu,
          ),
          PageViewApp(
            screenHeight: _yPosition,
            onChangeCallback: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              double top = _screenHeight * .25;
              double bottom = _screenHeight * .80;
              double midle = (bottom - top) / 2;

              setState(() {
                _yPosition += details.delta.dy;
                _yPosition = _yPosition < top ? top : _yPosition;
                _yPosition = _yPosition > bottom ? bottom : _yPosition;

                if (_yPosition != top && details.delta.dy < 0) {
                  _yPosition = _yPosition < (bottom - midle) ? top : _yPosition;
                }

                if (_yPosition != bottom && details.delta.dy > 0) {
                  _yPosition =
                      _yPosition > (top + midle - 50) ? bottom : _yPosition;
                }

                _showMenu = _yPosition == bottom
                    ? true
                    : (_yPosition == top ? false : _showMenu);
              });
            },
            showMenu: _showMenu,
          ),
          BulletsApp(
            screenHeight: _screenHeight * .70,
            currentIndex: _currentIndex,
            showMenu: _showMenu,
          ),
          BottomMenu(
            showMenu: _showMenu,
          ),
        ],
      ),
    );
  }
}
