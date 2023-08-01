import 'package:advicer_app/app/application/core/services/logger_service.dart';

import '../../../domain/failures/failures.dart';

mixin ErrorMessages {
  static String get _cacheErrorMessage => 'Ups, cache failed. Please, try again';
  static String get _generalErrorMessage => 'Ups, something gone wrong. Please, try again';
  static String get _serverErrorMessage => 'Ups, API Error. Please, try again';

  String mapErrorMessage(Failure f) {
    LoggerService().log('Error State', [f.runtimeType]);
    switch (f.runtimeType) {
      case ServerFailure:
        return _serverErrorMessage;
      case CacheFailure:
        return _cacheErrorMessage;
      default:
        return _generalErrorMessage;
    }
  }
}
