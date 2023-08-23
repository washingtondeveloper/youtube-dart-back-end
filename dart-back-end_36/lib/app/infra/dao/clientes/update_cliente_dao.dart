part of infra;

class UpdateClienteDAO implements UpdateClienteGateway {
  final Connection connection;

  UpdateClienteDAO(this.connection);

  @override
  Future<Cliente> call(Cliente cliente) async {
    try {
      final rows = await connection.query(
          'UPDATE clientes SET nome=@nome, email=@email, telefone=@telefone WHERE id=@id returning *',
          {
            'id': cliente.id,
            'nome': cliente.nome,
            'email': cliente.email,
            'telefone': cliente.telefone,
          });

      return rows.map(ClienteDB.toEntity).first;
    } finally {
      await connection.close();
    }
  }
}
