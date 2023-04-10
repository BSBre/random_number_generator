import 'package:flutter/material.dart';
import 'package:random_number_generator/shared/register_dependencies.dart';

import 'navigation/_navigation.dart';
import 'style/_style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    registerDependencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  final theme = lightTheme();
  return MaterialApp.router(
    routerConfig: router,
    theme: theme,
    themeMode: ThemeMode.light,
  );
  }
}

