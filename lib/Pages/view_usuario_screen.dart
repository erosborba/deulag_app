import 'package:deulag_app/Models/usuarios.dart';
import 'package:flutter/material.dart';

class ViewUsuarioScreen extends StatelessWidget {
  final Usuario usuario;
  ViewUsuarioScreen({this.usuario});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver Usuario'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage:
                  AssetImage(usuario.image ?? 'assets/images/pilotos/stig.jpg'),
            ),
            Text(
              usuario.nome + ' ' + usuario.equipe,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(usuario.pontos.toString(),
                style: TextStyle(fontSize: 13, color: Colors.black54))
          ],
        ),
      ),
    );
  }
}
