import 'package:flutter/material.dart';

import '../constants.dart';

class LeaderBoardList extends StatelessWidget {
  final String nome, equipe, imagem;
  final int pontos, position;
  final int cor;

  LeaderBoardList(
      {this.nome,
      this.equipe,
      this.imagem,
      this.cor,
      this.pontos,
      this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kBoxShadow,
        borderRadius: kBoxRadius16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Text(
            position.toString(),
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage:
                AssetImage(imagem ?? 'assets/images/pilotos/stig.jpg'),
          ),
          SizedBox(
            width: 200,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [TextSpan(text: nome + "\n"), TextSpan(text: equipe)],
              ),
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(text: pontos.toString() + "\n"),
                TextSpan(text: 'PTS')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
