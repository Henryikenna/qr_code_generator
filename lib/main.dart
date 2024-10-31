import 'package:flutter/material.dart';
import 'package:qr_generator_app_for_eazilink/screens/qr_generator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Generator for Eazilink',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7F1F9A)),
        useMaterial3: true,
      ),
      home: const QRCodeGeneratorScreen(),
    );
  }
}
