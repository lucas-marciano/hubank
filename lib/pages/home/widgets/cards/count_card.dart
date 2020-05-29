import 'package:flutter/material.dart';
import 'package:hubank/pages/home/widgets/cards/card_components/bottom_card.dart';
import 'package:hubank/pages/home/widgets/cards/card_components/title_card.dart';

class CountCard extends StatefulWidget {
  @override
  _CountCardState createState() => _CountCardState();
}

class _CountCardState extends State<CountCard>
    with AutomaticKeepAliveClientMixin {
  bool _showSaldo = false;

  Widget _buildMainInfoBlock() => Expanded(
        flex: 3,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TitleCard(
                      icon: Icons.attach_money,
                      text: "Conta",
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showSaldo = !_showSaldo;
                        });
                      },
                      child: Icon(
                        !_showSaldo ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              _buildBalanceAvailable(2500),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      );

  Widget _buildBalanceAvailable(double value) => Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Saldo disponível',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              _showSaldo
                  ? Text.rich(
                      TextSpan(
                        text: 'R\$ $value',
                      ),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                      ),
                    )
                  : Container(
                      height: 32,
                      width: 160,
                      color: Colors.grey[300],
                    ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: <Widget>[
          _buildMainInfoBlock(),
          BottomCard(
            description:
                "Compra mais recente em Super Mercado no valor de R\$ 150,00 sexta",
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
