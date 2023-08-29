part of api;

class ClientesController implements Controller {
  final GetClientesUseCase getClientesUseCase;
  final AddClienteUseCase addClienteUseCase;
  final GetClienteByIdUseCase getClienteByIdUseCase;
  final DeleteClienteUseCase deleteClienteUseCase;
  final UpdateClienteUseCase updateClienteUseCase;

  ClientesController({
    required this.getClientesUseCase,
    required this.addClienteUseCase,
    required this.getClienteByIdUseCase,
    required this.deleteClienteUseCase,
    required this.updateClienteUseCase,
  });
  @override
  String get route => '/clientes';

  @override
  Map<String, Handler> get handlers => {
        'GET': GetClientesHandler(
          getClientesUseCase: getClientesUseCase,
        ),
        'GET /{clienteId}': GetClienteByIdHandler(
          getClienteByIdUseCase: getClienteByIdUseCase,
        ),
        'DELETE /{clienteId}': DeleteClienteHandler(
          deleteClienteUseCase: deleteClienteUseCase,
        ),
        'PUT /{clienteId}': UpdateClienteHandler(
          updateClienteUseCase: updateClienteUseCase,
        ),
        'POST': AddClienteHandler(
          addClienteUseCase: addClienteUseCase,
        ),
      };
}
