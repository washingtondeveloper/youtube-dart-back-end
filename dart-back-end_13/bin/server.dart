import 'package:dart_back_end_13/config/config.dart';
import 'package:dart_back_end_13/server/server.dart';

void main() {
  Server.bootstrap(controllers)
      .then((server) => print('Server listening on port ${server.port}'))
      .catchError(print);
}
