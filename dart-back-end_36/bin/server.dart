import 'package:dart_back_end_36/config/config.dart';
import 'package:dart_back_end_36/server/server.dart';

void main() {
  ApiDI.init();
  Server.bootstrap(controllers)
      .then((server) => print('Server listening on port ${server.port}'))
      .catchError(print);
}
