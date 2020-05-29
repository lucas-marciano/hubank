import 'package:flutter/material.dart';

class ItemMenuBottom extends StatelessWidget {
  final double _paddingHorizonta = 4;
  final double _paddingVertical = 6;

  final IconData icon;
  final String text;

  const ItemMenuBottom({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double widthCard = MediaQuery.of(context).size.width * .28;

    BoxDecoration _getDecoration() {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white24,
      );
    }

    EdgeInsets _getPadding() {
      return EdgeInsets.symmetric(
        horizontal: _paddingHorizonta,
        vertical: _paddingVertical,
      );
    }

    Column _getColum() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      );
    }

    return Padding(
      padding: _getPadding(),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _getColum(),
        ),
        width: widthCard,
        decoration: _getDecoration(),
      ),
    );
  }
}
