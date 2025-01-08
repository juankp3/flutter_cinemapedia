import 'package:flutter/material.dart';
import 'package:flutter_cinemapedia/config/router/app_route.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_cinemapedia/config/theme/app_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme().getTheme(),
    );
  }
}
