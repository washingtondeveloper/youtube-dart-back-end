library api;

import '../domain/domain.dart';

part 'controllers/controller.dart';
part 'controllers/clientes/clientes_controller.dart';

part 'handlers/handler.dart';
part 'handlers/clientes/get_clientes_handler.dart';
part 'handlers/clientes/add_cliente_handler.dart';
part 'handlers/clientes/get_cliente_by_id_handler.dart';
part 'handlers/clientes/delete_cliente_handler.dart';
part 'handlers/clientes/update_cliente_handler.dart';

part 'messages/message_error.dart';

part 'dto/cliente_output_dto.dart';
part 'dto/cliente_input_dto.dart';
