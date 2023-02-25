part of api;

class ResponseHandler<T> {
  final StatusHandler status;
  final T? body;

  ResponseHandler({
    required this.status,
    this.body,
  });
}

enum StatusHandler {
  ok,
  internalServerError,
}

abstract class Handler {
  Future<ResponseHandler> call();
}
