import '../constants.dart';
import '../services/usuario_services.dart';
import 'package:flutter/material.dart';
import 'usuarios.dart';

class LeaderBoard extends StatelessWidget {
  final UsuarioService usuarioService = UsuarioService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Usuario>>(
      future: usuarioService.get(),
      builder: (BuildContext context, AsyncSnapshot<List<Usuario>> snapshot) {
        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ],
          );
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting result...'),
                  )
                ]);
          default:
            final usuarios = snapshot.data;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PodiumDriver(
                  position: 2,
                  name: usuarios[1].nome,
                  team: usuarios[1].equipe,
                  points: usuarios[1].pontos,
                  image: usuarios[1].image ?? 'assets/images/crown.png',
                ),
                LeaderDriver(
                  name: usuarios[0].nome,
                  team: usuarios[0].equipe,
                  points: usuarios[0].pontos,
                  image: usuarios[0].image ?? 'assets/images/crown.png',
                ),
                PodiumDriver(
                  position: 3,
                  name: usuarios[2].nome,
                  team: usuarios[2].equipe,
                  points: usuarios[2].pontos,
                  image: usuarios[2].image ?? 'assets/images/crown.png',
                )
              ],
            );
        }
      },
    );
  }
}

class LeaderDriver extends StatelessWidget {
  final String name;
  final String team;
  final int points;
  final String image;

  LeaderDriver({this.name, this.team, this.points, this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              radius: 55.0,
              backgroundImage: AssetImage(image),
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
        ],
      ),
    );
  }
}

class PodiumDriver extends StatelessWidget {
  final int position;
  final String name;
  final String team;
  final int points;
  final String image;

  PodiumDriver({this.position, this.name, this.team, this.points, this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            position.toString(),
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
              backgroundImage: AssetImage(image),
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
        ],
      ),
    );
  }
}
