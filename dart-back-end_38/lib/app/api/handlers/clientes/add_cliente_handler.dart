part of api;

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
      return ResponseHandler(status: StatusHandler.internalServerError);
    }
  }
}
