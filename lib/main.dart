import 'package:flutter/material.dart';
import 'package:rechnungstool/config/theme/theme.dart';
import 'package:rechnungstool/presentation/homepage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rechnungstool',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
