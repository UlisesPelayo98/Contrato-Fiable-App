
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/scan_page.dart';
import 'pages/historial_page.dart';
import 'pages/ia_page.dart';
import 'pages/translate_page.dart';

void main() {
  runApp(ContratoSeguroApp());
}

class ContratoSeguroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contrato Seguro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/scan': (context) => ScanPage(),
        '/historial': (context) => HistorialPage(),
        '/ia': (context) => IaPage(),
        '/translate': (context) => TranslatePage(),
      },
    );
  }
}
