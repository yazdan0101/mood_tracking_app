import 'package:flutter/material.dart';

void main() {
  runApp(const MoodTrackingApp());
}
class MoodTrackingApp extends StatelessWidget {
  const MoodTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello mood'),
      ),
    );
  }
}



