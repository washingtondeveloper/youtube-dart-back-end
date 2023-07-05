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

  factory ClienteOutputDTO.toDTO(Cliente cliente) {
    return ClienteOutputDTO(
        id: cliente.id,
        nome: cliente.nome,
        email: cliente.email,
        telefone: cliente.telefone);
  }

  static List<ClienteOutputDTO> toCollectionDTO(List<Cliente> clientes) {
    return clientes.map(ClienteOutputDTO.toDTO).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
    };
  }
}
