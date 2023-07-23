part of api;

class GetClienteByIdHandler implements Handler {
  final GetClienteByIdUseCase getClienteByIdUseCase;

  GetClienteByIdHandler({required this.getClienteByIdUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    try {
      final clienteId = requestParams.path!['clienteId'];
      final cliente = await getClienteByIdUseCase(int.parse(clienteId));
      return ResponseHandler(
        status: StatusHandler.ok,
        body: ClienteOutputDTO.toDTO(cliente),
      );
    } on ClienteNotFoundException {
      return ResponseHandler(
        status: StatusHandler.notFound,
        body: MessageError('Cliente não encontrado'),
      );
    } catch (e) {
      return ResponseHandler(status: StatusHandler.internalServerError);
    }
  }
}
