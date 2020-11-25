import 'package:flutter/material.dart';

import '../constants.dart';

class MenuHome extends StatelessWidget {
  final String line1;
  final String line2;

  MenuHome({this.line1, this.line2});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0XFFEFF3F6),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: kBoxShadow,
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                        text: line1,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        )),
                    TextSpan(
                      text: line2,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
