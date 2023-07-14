import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../data/datasources/advice_remote_datasource.dart';
import '../../../data/repositories/advice_repo_impl.dart';
import '../../../domain/repositories/advice_repository.dart';
import '../../../domain/usecases/advice_usecase.dart';

import 'advice_page.dart';
import 'bloc/advice_bloc.dart';

class AdviceBind {
  const AdviceBind._();

  static Widget get page => MultiBlocProvider(
        providers: [
          Provider<AdviceRemoteDatasource>(
            create: (context) => AdviceRemoteDatasourceImpl(
              client: context.read(),
            ),
          ),
          Provider<AdviceRepository>(
            create: (context) => AdviceRepositoryImpl(
              adviceRemoteDatasource: context.read(),
            ),
          ),
          BlocProvider(
            create: (context) => AdviceBloc(
              useCase: AdviceUseCase(
                repository: context.read(),
              ),
            ),
          ),
        ],
        child: const AdvicePage(),
      );
}
