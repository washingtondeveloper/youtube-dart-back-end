library infra;

import 'package:dart_back_end_06/app/domain/domain.dart';

import '../data/data.dart';

part 'dao/clientes/get_clientes_dao.dart';
part 'connection/connection.dart';

class ClienteDB {
  ClienteDB._();

  static Cliente toEntity(Map<String, dynamic> row) {
    return Cliente(
        id: row['id'],
        nome: row['nome'],
        email: row['email'],
        telefone: row['telefone']);
  }
}
