import 'package:flutter/material.dart';

class AppBarDark extends StatelessWidget {
  final bool showMenu;
  final VoidCallback onTapMenu;

  const AppBarDark({Key key, this.showMenu, this.onTapMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        GestureDetector(
          onTap: onTapMenu,
          child: Container(
            height: MediaQuery.of(context).size.height * .20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      "https://logodownload.org/wp-content/uploads/2019/08/nubank-logo-3.png",
                      height: 35,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Lucas",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Icon(showMenu ? Icons.expand_less : Icons.expand_more)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
