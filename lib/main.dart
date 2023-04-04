import 'package:flutter/material.dart';
import 'package:projeto_final/pages/home_page.dart';

void main() => runApp(const Superbarato());

class Superbarato extends StatelessWidget {
  const Superbarato({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ).copyWith(
          secondary: Colors.redAccent[300],
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary),
      ),
      home: const HomePage(),
    );
  }
}