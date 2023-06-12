import 'package:dart_back_end_17/config/config.dart';
import 'package:dart_back_end_17/server/server.dart';

void main() {
  Server.bootstrap(controllers)
      .then((server) => print('Server listening on port ${server.port}'))
      .catchError(print);
}
