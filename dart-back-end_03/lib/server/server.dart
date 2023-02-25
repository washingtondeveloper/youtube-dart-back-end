import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

class Server {
  static Future<HttpServer> bootstrap() async {
    // Use any available host or container IP (usually `0.0.0.0`).
    final ip = InternetAddress.anyIPv4;

    final router = Router();

    // Configure a pipeline that logs requests.
    final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

    // For running in containers, we respect the PORT environment variable.
    final port = int.parse(Platform.environment['PORT'] ?? '8080');
    return await serve(handler, ip, port);
  }
}
