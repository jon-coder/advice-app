import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application/core/services/theme_service.dart';
import 'application/core/ui/theme/app_theme.dart';
import 'application/pages/advice/advice_bind.dart';

class AdvicerApp extends StatelessWidget {
  const AdvicerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: ((context, themeService, child) {
        return MaterialApp(
          themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: AdviceBind.page,
        );
      }),
    );
  }
}
