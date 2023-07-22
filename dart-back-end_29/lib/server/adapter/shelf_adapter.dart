part of '../server.dart';

class ShelfAdapter {
  final List<Controller> controllers;

  ShelfAdapter({required this.controllers});

  void handler(Router router) {
    for (final controller in controllers) {
      _handler(controller, router);
    }
  }

  void _handler(Controller controller, Router router) {
    final route = controller.route;
    final handlers = controller.handlers;

    for (final myHandler in handlers.entries) {
      final verb = myHandler.key;
      router.add(verb, route, (Request request) async {
        final payload = await request.readAsString();
        final responseHandler = await myHandler.value(RequestParams(
          body: payload.isNotEmpty ? jsonDecode(payload) : null,
        ));

        switch (responseHandler.status) {
          case StatusHandler.ok:
            return ResponseJSON.ok(responseHandler.body);
          case StatusHandler.created:
            return ResponseJSON.created(responseHandler.body);
          case StatusHandler.badRequest:
            return ResponseJSON.badRequest(responseHandler.body);
          default:
            return Response.internalServerError();
        }
      });
    }
  }
}
