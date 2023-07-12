import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/advicer_app.dart';
import 'app/application/core/services/theme_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: const AdvicerApp(),
    ),
  );
}
