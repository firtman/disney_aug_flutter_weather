import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/pages/homepage.dart';
import 'package:flutter_weather/services/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 33, 62, 6)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
