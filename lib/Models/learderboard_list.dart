import 'package:deulag_app/Models/hex_color_converter.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LeaderBoardList extends StatelessWidget {
  final String nome, equipe, imagem, cor;
  final int pontos, position;

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
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kBoxShadow,
        borderRadius: kBoxRadius16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 16,
              child: Text(
                position.toString(),
                style: kTabelaPontos,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 10,
            decoration: BoxDecoration(
              color: HexColor(cor ?? "#121212"),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(0),
              ),
            ),
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
                children: [
                  TextSpan(text: nome + "\n", style: kTabelaNome),
                  TextSpan(text: equipe, style: kTabelaEquipe)
                ],
              ),
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: pontos.toString() + "\n",
                ),
                TextSpan(text: 'PTS')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
