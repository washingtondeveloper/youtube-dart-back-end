part of data;

class DeleteClienteService implements DeleteClienteUseCase {
  final DeleteClienteGateway deleteClienteGateway;
  final GetClienteByIdUseCase getClienteByIdUseCase;

  DeleteClienteService({
    required this.deleteClienteGateway,
    required this.getClienteByIdUseCase,
  });
  @override
  Future<void> call(int clienteId) async {
    await getClienteByIdUseCase(clienteId);
    await deleteClienteGateway(clienteId);
  }
}
