import 'package:bus_flow_admin/config/theme/app_theme.dart';
import 'package:bus_flow_admin/core/router/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bus Flow - Admin App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // can switch to system if needed
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
