import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/core/theme/app_theme.dart';
import 'src/features/score_calculator/view/calculator_screen.dart';
import 'src/features/score_calculator/view_model/calculator_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CalculatorViewModel(),
      child: const MinhaNotaApp(),
    ),
  );
}

class MinhaNotaApp extends StatelessWidget {
  const MinhaNotaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Nota UNIFEOB',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const CalculatorScreen(),
    );
  }
}