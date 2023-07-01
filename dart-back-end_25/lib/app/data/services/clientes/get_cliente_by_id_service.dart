part of data;

class GetClienteByIdService implements GetClienteByIdUseCase {
  final GetClienteByIdGateway getClienteByIdGateway;

  GetClienteByIdService({required this.getClienteByIdGateway});
  @override
  Future<Cliente> call(int clienteId) async {
    final cliente = await getClienteByIdGateway(clienteId);
    if (cliente == null) {
      throw ClienteNotFoundException();
    }
    return cliente;
  }
}
