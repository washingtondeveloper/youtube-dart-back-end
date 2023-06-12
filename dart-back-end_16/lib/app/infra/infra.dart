library infra;

import 'package:dart_back_end_16/app/domain/domain.dart';
import 'package:postgres/postgres.dart';

import '../data/data.dart';

part 'dao/clientes/get_clientes_dao.dart';
part 'dao/clientes/get_cliente_by_email_dao.dart';

part 'connection/connection.dart';
part 'connection/fake/fake_db.dart';
part 'connection/postgres/postgres.dart';

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
