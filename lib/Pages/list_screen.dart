import 'package:deulag_app/Models/learderboard_list.dart';

import '../Models/usuarios.dart';
import '../services/usuario_services.dart';
import 'package:flutter/material.dart';

import 'view_usuario_screen.dart';

class ListScreen extends StatelessWidget {
  final UsuarioService usuarioService = UsuarioService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
      ),
      body: Center(
        child: FutureBuilder<List<Usuario>>(
          future: usuarioService.get(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Usuario>> snapshot) {
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
                  ]);
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
                return ListView.builder(
                  itemCount: usuarios.length,
                  itemBuilder: (BuildContext context, int index) {
                    var driver = usuarios[index];
                    return LeaderBoardList(
                      nome: driver.nome,
                      equipe: driver.equipe,
                      imagem: driver.image,
                      pontos: driver.pontos,
                      position: (index + 1),
                    );
                    // ListTile(
                    //   leading: CircleAvatar(
                    //     radius: 25,
                    //     backgroundImage: AssetImage(usuarios[index].image ??
                    //         'assets/images/pilotos/stig.jpg'),
                    //   ),
                    //   title: Text((index + 1).toString()),
                    //   subtitle: Text(usuarios[index].pontos.toString()),
                    //   onTap: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => ViewUsuarioScreen(
                    //               usuario: usuarios[index],
                    //             )));
                    //   },
                    // );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
