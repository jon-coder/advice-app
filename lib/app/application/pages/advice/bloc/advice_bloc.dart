import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());
      debugPrint('fake get advice trigged');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('Get some response');
      emit(AdviceStateLoaded(advice: 'Return my fake advice'));
    });
  }
}
