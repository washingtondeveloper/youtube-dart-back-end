part of data;

class UpdateClienteService implements UpdateClienteUseCase {
  final UpdateClienteGateway updateClienteGateway;
  final GetClienteByIdUseCase getClienteByIdUseCase;

  UpdateClienteService({
    required this.updateClienteGateway,
    required this.getClienteByIdUseCase,
  });
  @override
  Future<Cliente> call(Cliente cliente) async {
    await getClienteByIdUseCase(cliente.id);
    return await updateClienteGateway(cliente);
  }
}
