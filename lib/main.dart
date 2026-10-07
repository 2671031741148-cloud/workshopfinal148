import 'package:flutter/material.dart';
import 'package:workshopfinal_1_148/screen/main_home_screen.dart';


void main() {
  runApp(const EcoCarbonApp());
}

class EcoCarbonApp extends StatelessWidget {
  const EcoCarbonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoCarbon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const MainHomeScreen(),
    );
  }
}