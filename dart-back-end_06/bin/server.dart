import 'package:dart_back_end_06/server/server.dart';

void main() {
  Server.bootstrap()
      .then((server) => print('Server listening on port ${server.port}'))
      .catchError(print);
}
