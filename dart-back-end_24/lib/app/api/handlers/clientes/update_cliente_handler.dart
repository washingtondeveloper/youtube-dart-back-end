part of api;

class UpdateClienteHandler implements Handler {
  final UpdateClienteUseCase updateClienteUseCase;

  UpdateClienteHandler({required this.updateClienteUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    try {
      final clienteId = int.parse(requestParams.path!['clienteId']);
      final body = {...requestParams.body!, 'id': clienteId};

      final cliente = ClienteInputDTO.toEntity(body);
      final clienteAtualizado = await updateClienteUseCase(cliente);
      return ResponseHandler(
        status: StatusHandler.ok,
        body: ClienteOutputDTO.toDTO(clienteAtualizado),
      );
    } on ClienteNotFoundException {
      return ResponseHandler(
          status: StatusHandler.notFound,
          body: MessageError('Cliente não encontrado'));
    } catch (e) {
      return ResponseHandler(status: StatusHandler.internalServerError);
    }
  }
}
