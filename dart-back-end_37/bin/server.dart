import 'package:dart_back_end_37/config/config.dart';
import 'package:dart_back_end_37/server/server.dart';

void main() {
  ApiDI.init();
  Server.bootstrap(controllers)
      .then((server) => print('Server listening on port ${server.port}'))
      .catchError(print);
}
