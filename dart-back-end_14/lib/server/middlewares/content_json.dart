part of '../server.dart';

Middleware contentJSON() {
  return createMiddleware(
      responseHandler: (response) =>
          response.change(headers: {'content-type': 'application/json'}));
}
