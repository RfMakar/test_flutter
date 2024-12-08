import 'package:flutter/material.dart';
import 'package:test_flutter/presentation/screens/car.dart';
import 'package:test_flutter/presentation/screens/home.dart';

class Aplication extends StatelessWidget {
  const Aplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/car': (context) => const CarScreen(),
      },
      
    );
  }
}
