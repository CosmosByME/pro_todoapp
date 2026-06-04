import 'package:flutter/material.dart';
import 'package:pro_todoapp/core/main_widgets/on_tap.dart';
import 'package:pro_todoapp/core/theme/app_theme.dart';
import 'package:pro_todoapp/presentation/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pro ToDo',
      theme: appTheme,
      home: OnTap(child: const HomePage()),
    );
  }
}
