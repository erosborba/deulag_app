import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../constants.dart';
import 'card_content.dart';

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
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

      child: Card(
          color: kSurfaceColor,
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
                child: Image.asset(
                  'assets/$assetName',
                  height: MediaQuery.of(context).size.height * 0.3,
                  alignment: Alignment(-offset.abs(), 0),
                  fit: BoxFit.none,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: CardContent(
                  name: name,
                  date: date,
                  offset: gauss,
                ),
              ),
            ],
          )),
    );
  }
}
