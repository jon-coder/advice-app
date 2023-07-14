import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/advice_usecase.dart';
import '../../../core/helpers/error_messages.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> with ErrorMessages {
  final AdviceUseCase useCase;

  AdviceBloc({
    required this.useCase,
  }) : super(AdviceInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());
      final failureOrAdvice = await useCase.getAdvice();
      failureOrAdvice.fold(
        (l) => emit(AdviceStateError(message: mapErrorMessage(l))),
        (r) => emit(AdviceStateLoaded(advice: r.advice)),
      );
    });
  }
}
