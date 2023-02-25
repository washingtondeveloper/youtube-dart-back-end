part of api;

class ResponseHandler {
  final StatusHandler status;
  final Object body;

  ResponseHandler({
    required this.status,
    required this.body,
  });
}

enum StatusHandler {
  ok,
}

abstract class Handler {
  Future<ResponseHandler> call();
}
