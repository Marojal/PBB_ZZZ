import 'package:flutter/material.dart';
import 'package:sh/pages/suhu.dart';
import 'package:sh/pages/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/calendar',
      routes: {
        '/suhu': (context) => const SuhuPage(),
        '/calendar': (context) => const CalendarPage(),
      },
    );
  }
}
