part of api;

class ClientesController implements Controller {
  final GetClientesUseCase getClientesUseCase;
  final AddClienteUseCase addClienteUseCase;

  ClientesController({
    required this.getClientesUseCase,
    required this.addClienteUseCase,
  });
  @override
  String get route => '/clientes';

  @override
  Map<String, Handler> get handlers => {
        'GET': GetClientesHandler(
          getClientesUseCase: getClientesUseCase,
        ),
        'POST': AddClienteHandler(
          addClienteUseCase: addClienteUseCase,
        ),
      };
}
