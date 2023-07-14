import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/rest_client/http_client.dart';
import '../../../infra/http_adapter.dart';
import '../../../infra/http_adapter_factory.dart';

import '../services/theme_service.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget _child;

  const ApplicationBinding({
    super.key,
    required Widget child,
  }) : _child = child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HttpClient>(
          create: (context) => HttpAdapter(
            client: makeHttpFactory(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeService.i,
        )
      ],
      child: _child,
    );
  }
}
