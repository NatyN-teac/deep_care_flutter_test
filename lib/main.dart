import 'package:deep_care_test/src/screen/history_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Deep Care',
      debugShowCheckedModeBanner: false,
      home: HistoryScreen()
    );
  }
}
