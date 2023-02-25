part of api;

class GetClientesHandler implements Handler {
  @override
  Future<ResponseHandler> call() async {
    return ResponseHandler(
      status: StatusHandler.ok,
      body: <ClienteOutputDTO>[],
    );
  }
}
