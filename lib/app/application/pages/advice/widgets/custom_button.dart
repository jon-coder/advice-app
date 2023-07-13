import 'package:advicer_app/app/application/core/helpers/size_extensions.dart';
import 'package:advicer_app/app/application/pages/advice/bloc/advice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onTap: () => BlocProvider.of<AdviceBloc>(context).add(AdviceRequestedEvent()),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: themeData.colorScheme.secondary,
          ),
          width: context.percentWidth(.4),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Text(
              'Get Advice',
              style: themeData.textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
