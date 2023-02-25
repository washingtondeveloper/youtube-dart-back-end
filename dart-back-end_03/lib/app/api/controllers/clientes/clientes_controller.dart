part of api;

class ClientesController implements Controller {
  @override
  String get route => '/clientes';

  @override
  Map<String, Handler> get handlers => {
        'GET': GetClientesHandler(),
      };
}
