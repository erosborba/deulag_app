import 'package:flutter/material.dart';

class MenuHome extends StatelessWidget {
  final String title;

  MenuHome({this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.10,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0XFFEFF3F6),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
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
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'Proximas ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  ),
                  TextSpan(
                    text: 'Etapas',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
