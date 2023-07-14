/// Http Client
///
/// Interface Responsible for Defining our Http Contract.
abstract class HttpClient {
  Future request({
    required String url,
    required RequestMethod method,
    Map<String, dynamic> body = const {},
    Map<String, String> headers = const {},
  });
}

/// Request Method Type
enum RequestMethod {
  get,
  put,
  post,
  patch,
  delete,
}
