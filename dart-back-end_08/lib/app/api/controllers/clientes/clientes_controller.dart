part of api;

class ClientesController implements Controller {
  final GetClientesUseCase getClientesUseCase;

  ClientesController({required this.getClientesUseCase});
  @override
  String get route => '/clientes';

  @override
  Map<String, Handler> get handlers => {
        'GET': GetClientesHandler(
          getClientesUseCase: getClientesUseCase,
        ),
      };
}
