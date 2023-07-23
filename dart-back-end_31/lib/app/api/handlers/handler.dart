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
  final Map<String, dynamic>? path;

  RequestParams({this.body, this.path});
}

enum StatusHandler {
  ok,
  internalServerError,
  created,
  badRequest,
  noContent,
  notFound,
}

abstract class Handler {
  Future<ResponseHandler> call(RequestParams requestParams);
}
