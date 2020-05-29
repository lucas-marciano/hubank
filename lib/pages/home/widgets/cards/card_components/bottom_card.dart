import 'package:flutter/material.dart';

// TODO: make it this method receive a model to fill the last buy

class BottomCard extends StatelessWidget {
  final String description;

  const BottomCard({Key key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 1,
        child: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
                SizedBox(width: 5),
                Flexible(
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey[400],
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      );
}
