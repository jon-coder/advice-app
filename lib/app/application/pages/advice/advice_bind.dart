import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'advice_page.dart';
import 'bloc/advice_bloc.dart';

class AdviceBind {
  const AdviceBind._();

  static Widget get page => BlocProvider(
        create: (context) => AdviceBloc(),
        child: const AdvicePage(),
      );
}
