import 'package:flutter/material.dart';

import '../constants.dart';

class PilotClassification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height / 4,
      child: Row(
        children: [
          PodiumDrivers(),
          LeaderDriver(
            name: 'Eros Borba',
            pos: 1,
            team: 'Gurgel Racing',
            points: 80,
          ),
          PodiumDrivers()
        ],
      ),
    );
  }
}

class PodiumDrivers extends StatelessWidget {
  final int pos;
  final String name;
  final String team;
  final int points;

  PodiumDrivers({this.pos, this.name, this.team, this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('1'),
          CircleAvatar(),
          Text('Nome'),
          Text('Equipe'),
          Text('111')
        ],
      ),
    );
  }
}

class LeaderDriver extends StatelessWidget {
  final int pos;
  final String name;
  final String team;
  final int points;

  LeaderDriver({this.pos, this.name, this.team, this.points});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image(
          image: AssetImage('assets/images/crown.png'),
          height: 50,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 3,
                color: Colors.grey.shade500,
                spreadRadius: 2,
              )
            ],
          ),
          child: CircleAvatar(
            radius: 45.0,
            backgroundImage: AssetImage('assets/images/stig.jpg'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: kTabelaNome,
        ),
        Text(
          team,
          style: kTabelaEquipe,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          points.toString(),
          style: kTabelaPontos,
        )
      ]),
    );
  }
}
