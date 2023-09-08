part of api;

class DeleteClienteHandler implements Handler {
  final DeleteClienteUseCase deleteClienteUseCase;

  DeleteClienteHandler({required this.deleteClienteUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    try {
      final clienteId = requestParams.path!['clienteId'];
      await deleteClienteUseCase(int.parse(clienteId));
      return ResponseHandler(status: StatusHandler.noContent);
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
