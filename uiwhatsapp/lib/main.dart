import 'package:flutter/material.dart';
import 'package:uiwhatsapp/whatsapp_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: const WhatsappPage(),
    );
  }
}
