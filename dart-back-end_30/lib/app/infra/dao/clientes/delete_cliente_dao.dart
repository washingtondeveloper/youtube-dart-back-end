part of infra;

class DeleteClienteDAO implements DeleteClienteGateway {
  final Connection connection;

  DeleteClienteDAO(this.connection);

  @override
  Future<void> call(int clienteId) async {
    try {
      await connection.query('DELETE FROM clientes WHERE id=@id', {
        'id': clienteId,
      });
    } finally {
      await connection.close();
    }
  }
}
