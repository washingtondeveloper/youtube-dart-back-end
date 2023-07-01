part of data;

abstract class GetClienteByEmailGateway {
  Future<Cliente?> call(String email);
}
