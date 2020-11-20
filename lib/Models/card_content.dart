import 'package:flutter/material.dart';

import '../constants.dart';

class CardContent extends StatelessWidget {
  final String name;
  final String pista;
  final String date;
  final double offset;

  const CardContent({Key key, this.name, this.pista, this.date, this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Transform.translate(
        offset: Offset(8 * offset, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: kTabelaNome,
            ),
            SizedBox(height: 1),
            Text(pista, textAlign: TextAlign.center, style: kTabelaTilePts),
            Spacer(),
            Row(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text('Domingo'),
              ),
              Spacer(),
              Container(
                width: 100,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0XFFEFF3F6),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(6, 2),
                        blurRadius: 6.0,
                        spreadRadius: 3.0),
                    BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                        offset: Offset(-6, -2),
                        blurRadius: 6.0,
                        spreadRadius: 3.0)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Center(
                  child: Text(
                    date,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: kTextColorDark),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
