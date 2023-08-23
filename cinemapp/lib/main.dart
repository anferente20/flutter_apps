import 'package:flutter/material.dart';

import 'package:cinemapp/config/router/app_router.dart';
import 'package:cinemapp/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkMode: true).getTheme(),
      routerConfig: appRouter,
    );
  }
}
