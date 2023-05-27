part of api;

class ResponseHandler<T> {
  final StatusHandler status;
  final T? body;

  ResponseHandler({
    required this.status,
    this.body,
  });
}

class RequestParams {
  final Map<String, dynamic>? body;

  RequestParams({this.body});
}

enum StatusHandler {
  ok,
  internalServerError,
  created,
}

abstract class Handler {
  Future<ResponseHandler> call(RequestParams requestParams);
}
