part of data;

abstract class GetClienteByIdGateway {
  Future<Cliente?> call(int clienteId);
}
