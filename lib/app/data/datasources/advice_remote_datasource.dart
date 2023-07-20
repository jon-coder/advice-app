import '../models/advice_model.dart';
import '../rest_client/http_client.dart';

abstract class AdviceRemoteDatasource {
  /// requests random advice from api
  /// return [AdviceModel] if successfull
  /// throws a server exception if status code is not 200
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final HttpClient client;

  AdviceRemoteDatasourceImpl({
    required this.client,
  });

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.request(
      url: 'https://api.flutter-community.com/api/v1/advice',
      method: RequestMethod.get,
    );
    return AdviceModel.fromJson(response);
  }
}
