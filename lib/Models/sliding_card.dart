import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../constants.dart';
import 'card_content.dart';

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String pista;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.pista,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(
      -(math.pow((offset.abs() - 0.5), 2) / 0.08),
    );
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0), // to make space between

      child: Container(
        child: Card(
          color: kSurfaceColor,
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 20, top: 20),
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.22,
                width: MediaQuery.of(context).size.height * 0.40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/$assetName',
                      //
                    ),
                    scale: 1.950,
                    alignment: Alignment(-offset.abs(), 0),
                    fit: BoxFit.none,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      30,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1),
              Expanded(
                child: CardContent(
                  name: name,
                  pista: pista,
                  date: date,
                  offset: gauss,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
