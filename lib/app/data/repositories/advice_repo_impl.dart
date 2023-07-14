import 'dart:developer';

import 'package:advicer_app/app/data/exceptions/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/advice_entity.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/advice_repository.dart';

import '../datasources/advice_remote_datasource.dart';

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
      log('Server error', error: e, stackTrace: s);
      return left(ServerFailure());
    } catch (e, s) {
      log('General error', error: e, stackTrace: s);
      return left(GeneralFailure());
    }
  }
}
