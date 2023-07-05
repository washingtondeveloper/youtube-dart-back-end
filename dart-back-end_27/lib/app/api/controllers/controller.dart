part of api;

abstract class Controller {
  final String route;
  final Map<String, Handler> handlers;
  Controller({
    required this.route,
    required this.handlers,
  });
}
