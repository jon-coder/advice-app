import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application/core/provider/application_binding.dart';
import 'application/core/services/logger_service.dart';
import 'application/core/services/theme_service.dart';
import 'application/core/ui/theme/app_theme.dart';
import 'application/pages/advice/advice_bind.dart';

class AdvicerApp extends StatefulWidget {
  const AdvicerApp({super.key});

  @override
  State<AdvicerApp> createState() => _AdvicerAppState();
}

class _AdvicerAppState extends State<AdvicerApp> {
  @override
  void initState() {
    super.initState();
    if (!kReleaseMode) {
      LoggerService();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: Consumer<ThemeService>(
        builder: ((context, themeService, child) {
          return MaterialApp(
            themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            home: AdviceBind.page,
          );
        }),
      ),
    );
  }
}
