import 'package:dartz/dartz.dart';

import '../entities/advice_entity.dart';
import '../failures/failures.dart';
import '../repositories/advice_repository.dart';

class AdviceUseCase {
  final AdviceRepository repository;
  AdviceUseCase({
    required this.repository,
  });

  Future<Either<Failure, AdviceEntity>> getAdvice() {
    return repository.getAdviceFromDatasource();
  }
}
