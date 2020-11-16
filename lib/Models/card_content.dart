import 'package:flutter/material.dart';

import '../constants.dart';

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent({Key key, this.name, this.date, this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Transform.translate(
        offset: Offset(8 * offset, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: kTextTitle,
            ),
            SizedBox(height: 8),
            Text(
              date,
              style: TextStyle(
                  //color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Spacer(),
            Row(children: [
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Text(
                  'Domingo',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
