import 'package:flutter/material.dart';
import 'package:new_sachetna/pages/started.dart'; // Import the StartedPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartedPage(), // Set StartedPage as the home page
    );
  }
}
