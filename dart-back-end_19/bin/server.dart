import 'package:dart_back_end_19/config/config.dart';
import 'package:dart_back_end_19/server/server.dart';

void main() {
  Server.bootstrap(controllers)
      .then((server) => print('Server listening on port ${server.port}'))
      .catchError(print);
}
