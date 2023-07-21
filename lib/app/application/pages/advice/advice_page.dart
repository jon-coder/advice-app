import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helpers/size_extensions.dart';
import '../../core/services/theme_service.dart';

import 'bloc/advice_bloc.dart';
import 'widgets/advice_field.dart';
import 'widgets/custom_button.dart';
import 'widgets/error_message.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advicer',
          style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: context.themeService.isDarkModeOn,
            onChanged: (_) {
              context.themeService.toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          children: [
            Expanded(
              child: Center(child: BlocBuilder<AdviceBloc, AdviceState>(
                builder: (context, state) {
                  if (state is AdviceInitial) {
                    return Text(
                      'Your advice is waiting for you',
                      style: themeData.textTheme.headline1,
                    );
                  } else if (state is AdviceStateLoading) {
                    return CircularProgressIndicator(
                      color: themeData.colorScheme.secondary,
                    );
                  } else if (state is AdviceStateLoaded) {
                    return AdviceField(
                      advice: state.advice,
                    );
                  } else if (state is AdviceStateError) {
                    return ErrorMessage(
                      message: state.message,
                    );
                  }
                  return const SizedBox();
                },
              )),
            ),
            SizedBox(
              height: context.percentHeight(.25),
              child: const Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
