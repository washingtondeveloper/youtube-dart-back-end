part of api;

class ClienteOutputDTO {
  final int id;
  final String nome;
  final String email;
  final String telefone;

  ClienteOutputDTO({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
  });
}
