import 'package:dart_back_end_23/config/config.dart';
import 'package:dart_back_end_23/server/server.dart';

void main() {
  Server.bootstrap(controllers)
      .then((server) => print('Server listening on port ${server.port}'))
      .catchError(print);
}
