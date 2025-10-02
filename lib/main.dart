import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/app_colors.dart';
import 'design_system/tokens/input_theme.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkme App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.blue500,
          brightness: Brightness.light,
        ),
        fontFamily: 'SUIT',
        useMaterial3: true,
        extensions: const [
          AppInputTheme(),
        ],
      ),
      home: const MainScreen(),
    );
  }
}
