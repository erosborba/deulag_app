import 'package:flutter/material.dart';

import 'card_content.dart';

class CardStyle extends StatelessWidget {
  final String assetName;

  CardStyle({this.assetName});
  @override
  Widget build(BuildContext context) {
    const offset = 1.0;
    return Container(
      padding: EdgeInsets.all(0),
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.height * 0.30,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF808080),
            offset: Offset(2.0, 1.0),
            blurRadius: 10.0,
          ),
        ],
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: AssetImage(
            'assets/$assetName',
            //
          ),
          alignment: Alignment(-offset.abs(), 0),
          fit: BoxFit.none,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            30,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.125,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
