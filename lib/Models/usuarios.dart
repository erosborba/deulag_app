class Usuario {
  String idUsuario;
  String nome;
  String equipe;
  String image;
  String cor;
  int pontos;

  static const String collectionId = 'Pilotos';
  Usuario(
      {this.idUsuario,
      this.nome,
      this.equipe,
      this.image,
      this.pontos,
      this.cor});

  Usuario.fromSnapshot(String idUsuario, Map<String, dynamic> usuario)
      : idUsuario = idUsuario,
        nome = usuario['nome'],
        equipe = usuario['equipe'],
        image = usuario['image'],
        pontos = usuario['pontos'],
        cor = usuario['cor'];

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
