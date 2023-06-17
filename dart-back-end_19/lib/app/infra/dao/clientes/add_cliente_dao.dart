part of infra;

class AddClienteDAO implements AddClienteGateway {
  final Connection connection;

  AddClienteDAO(this.connection);

  @override
  Future<Cliente> call(Cliente cliente) async {
    try {
      final rows = await connection.query(
          'INSERT INTO clientes (nome, email, telefone) VALUES (@nome, @email, @telefone) returning *',
          {
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
