import 'package:http/http.dart';

import '../application/core/services/logger_service.dart';
import '../data/exceptions/exceptions.dart';
import '../data/rest_client/http_client.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter({
    required this.client,
  });

  @override
  Future request({
    required String url,
    required RequestMethod method,
    Map<String, dynamic> body = const {},
    Map<String, String> headers = const {},
  }) async {
    late final Map<String, String> defaultHeaders;

    if (headers.isNotEmpty) {
      defaultHeaders = headers;
    } else {
      defaultHeaders = {
        'Content-Type': 'application/json',
        'accept': 'application/json',
      };
    }

    var response = Response('', 500, headers: defaultHeaders);
    late final Future<dynamic>? futureResponse;

    try {
      futureResponse = _getResponse(
        method: method,
        url: url,
        body: body,
      );
      response = await futureResponse.timeout(const Duration(seconds: 15));
    } catch (e, s) {
      LoggerService().log('Timeout error in HTTP Adapter', [e, s]);
      throw TimeOutException();
    }
    return _handleResponse(response);
  }

  Future<dynamic> _getResponse({
    required RequestMethod method,
    required String url,
    Map<String, dynamic> body = const {},
  }) {
    if (method == RequestMethod.get) {
      return client.get(Uri.parse(url));
    } else if (method == RequestMethod.put) {
      return client.put(
        Uri.parse(url),
        body: body,
      );
    } else if (method == RequestMethod.post) {
      return client.post(
        Uri.parse(url),
        body: body,
      );
    } else if (method == RequestMethod.patch) {
      return client.patch(
        Uri.parse(url),
        body: body,
      );
    } else if (method == RequestMethod.delete) {
      return client.delete(
        Uri.parse(url),
      );
    } else {
      return client.get(Uri.parse(url));
    }
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      LoggerService().log('Server error', ['Status Code ${response.statusCode}']);
      throw ServerException();
    }
  }
}
