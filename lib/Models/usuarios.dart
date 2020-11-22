class Usuario {
  String idUsuario;
  String nome;
  String equipe;
  String image;
  int pontos;

  static const String collectionId = 'Pilotos';
  Usuario({this.idUsuario, this.nome, this.equipe, this.image, this.pontos});

  Usuario.fromSnapshot(String idUsuario, Map<String, dynamic> usuario)
      : idUsuario = idUsuario,
        nome = usuario['nome'],
        equipe = usuario['equipe'],
        image = usuario['image'],
        pontos = usuario['pontos'];

  Map<String, dynamic> toMap() => {
        'nome': nome,
        'equipe': equipe,
        'image': image,
        'pontos': pontos,
      };

  @override
  String toString() {
    return 'Usuario{idUsuario: $idUsuario, nome: $nome, equipe: $equipe, image: $image,pontos:$pontos}';
  }
}
