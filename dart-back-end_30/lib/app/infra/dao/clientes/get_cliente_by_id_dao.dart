part of infra;

class GetClienteByIdDAO implements GetClienteByIdGateway {
  final Connection connection;

  GetClienteByIdDAO(this.connection);

  @override
  Future<Cliente?> call(int clienteId) async {
    try {
      final rows = await connection.query(
        'SELECT * FROM clientes WHERE id=@id',
        {'id': clienteId},
      );

      if (rows.isEmpty) return null;

      return rows.map(ClienteDB.toEntity).first;
    } finally {
      await connection.close();
    }
  }
}
