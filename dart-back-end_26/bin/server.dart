import 'package:dart_back_end_26/config/config.dart';
import 'package:dart_back_end_26/server/server.dart';

void main() {
  Server.bootstrap(controllers)
      .then((server) => print('Server listening on port ${server.port}'))
      .catchError(print);
}
