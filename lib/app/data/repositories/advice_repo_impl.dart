import 'package:dartz/dartz.dart';

import '../../application/core/services/logger_service.dart';
import '../../domain/entities/advice_entity.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/advice_repository.dart';

import '../datasources/advice_remote_datasource.dart';
import '../exceptions/exceptions.dart';

class AdviceRepositoryImpl implements AdviceRepository {
  final AdviceRemoteDatasource adviceRemoteDatasource;
  AdviceRepositoryImpl({
    required this.adviceRemoteDatasource,
  });

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final response = await adviceRemoteDatasource.getRandomAdviceFromApi();
      return right(response);
    } on ServerException catch (e, s) {
      LoggerService().log('Server error', [e, s]);
      return left(ServerFailure());
    } catch (e, s) {
      LoggerService().log('General Error', [e, s]);
      return left(GeneralFailure());
    }
  }
}
