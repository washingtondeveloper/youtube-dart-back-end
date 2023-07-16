part of api;

abstract class ClienteInputDTO {
  static Cliente toEntity(Map<String, dynamic> map) {
    return Cliente(
        id: map['id'] ?? 0,
        nome: map['nome'],
        email: map['email'],
        telefone: map['telefone']);
  }
}
