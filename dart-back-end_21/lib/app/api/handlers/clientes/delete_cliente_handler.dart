part of api;

class DeleteClienteHandler implements Handler {
  final DeleteClienteUseCase deleteClienteUseCase;

  DeleteClienteHandler({required this.deleteClienteUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) {
    throw UnimplementedError();
  }
}
