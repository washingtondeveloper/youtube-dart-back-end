part of infra;

class GetClienteByEmailDAO implements GetClienteByEmailGateway {
  final Connection connection;

  GetClienteByEmailDAO(this.connection);

  @override
  Future<Cliente?> call(String email) async {
    try {
      final rows = await connection
          .query('SELECT * FROM clientes WHERE email=@email', {'email': email});

      if (rows.isEmpty) return null;
      return rows.map(ClienteDB.toEntity).first;
    } finally {
      await connection.close();
    }
  }
}
