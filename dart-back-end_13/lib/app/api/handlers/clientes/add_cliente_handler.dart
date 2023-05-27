part of api;

abstract class ClienteInputDTO {
  static Cliente toEntity(Map<String, dynamic> map) {
    return Cliente(
        id: 0,
        nome: map['nome'],
        email: map['email'],
        telefone: map['telefone']);
  }
}

class AddClienteHandler implements Handler {
  final AddClienteUseCase addClienteUseCase;

  AddClienteHandler({required this.addClienteUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    try {
      final cliente = ClienteInputDTO.toEntity(requestParams.body!);
      final clienteCriado = await addClienteUseCase(cliente);
      return ResponseHandler(
        status: StatusHandler.created,
        body: ClienteOutputDTO.toDTO(clienteCriado),
      );
    } on JaExisteUmClienteComEsseEmailException {
      return ResponseHandler(
          status: StatusHandler.badRequest,
          body: MessageError('Ja existe um cliente com esse email'));
    } catch (e) {
      print(e.toString());
      return ResponseHandler(status: StatusHandler.internalServerError);
    }
  }
}
