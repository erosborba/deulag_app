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
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kBoxShadow,
        borderRadius: kBoxRadius16,
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 10,
                decoration: BoxDecoration(
                  color: HexColor(cor ?? "#121212"),
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
                    children: [
                      TextSpan(text: nome + "\n"),
                      TextSpan(text: equipe)
                    ],
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
          Container(
            height: 6,
            width: 65,
            decoration: BoxDecoration(
              color: HexColor(cor),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}
