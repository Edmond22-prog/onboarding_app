import 'package:flutter/material.dart';
import 'package:victoria_app1/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primary = Color(0xff33cc9f);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding App',
      theme: ThemeData(
        fontFamily: 'Nexa'
      ),
      home: const Home(),
    );
  }
}
