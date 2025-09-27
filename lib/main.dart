import 'package:anime_palyer/presntation/screens/home_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Animation Player Demo', home: HomeScreen());
  }
}
