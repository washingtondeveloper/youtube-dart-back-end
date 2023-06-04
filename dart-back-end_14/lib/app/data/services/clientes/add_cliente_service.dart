part of data;

class AddClienteService implements AddClienteUseCase {
  final AddClienteGateway addClienteGateway;

  AddClienteService({required this.addClienteGateway});
  @override
  Future<Cliente> call(Cliente cliente) async {
    return addClienteGateway(cliente);
  }
}
