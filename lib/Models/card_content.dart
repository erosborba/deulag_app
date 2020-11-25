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
              style: kEtapaNome,
            ),
            SizedBox(height: 1),
            Text(pista, textAlign: TextAlign.center, style: kEtapaEtapa),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
