part of api;

class UpdateClienteHandler implements Handler {
  final UpdateClienteUseCase updateClienteUseCase;

  UpdateClienteHandler({required this.updateClienteUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) {
    throw UnimplementedError();
  }
}
