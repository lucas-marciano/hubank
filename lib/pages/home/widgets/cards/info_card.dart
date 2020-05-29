import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  // TODO: make it this method receive a model to fill the last buy
  Widget _buildBottomInfo() => Expanded(
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
                    "Compra mais recente em super-mercado no valor de R\$300,00 sexta",
                    style: TextStyle(
                      color: Colors.grey,
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

  Widget _buildTopInfo() => Expanded(
        flex: 3,
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.credit_card, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(
                            "Cartão de crédito",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "FATURA ATUAL",
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          _buildCurrentValueToPay(300, 50),
                          _buildCurrentLimit(5000.60),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              _buildBarGraph(),
            ],
          ),
        ),
      );

// TODO: make it this method receive a model to fill graph
  Widget _buildBarGraph() => Padding(
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 10,
          right: 15,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.orange,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            width: 8,
          ),
        ),
      );

// TODO: make it this method receive a model to fill the curent limit and the value to pay
  Widget _buildCurrentLimit(double limit) => Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "Limite disponível "),
            TextSpan(
              text: "R\$ $limit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      );

  Widget _buildCurrentValueToPay(int integerValue, int decimalValue) =>
      Text.rich(
        TextSpan(
          text: "R\$ ",
          children: [
            TextSpan(
              text: "$integerValue",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: ",$decimalValue"),
          ],
        ),
        style: TextStyle(
          color: Colors.teal,
          fontSize: 28,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: [
          _buildTopInfo(),
          _buildBottomInfo(),
        ],
      ),
    );
  }
}
