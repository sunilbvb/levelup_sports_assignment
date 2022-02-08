import 'package:flutter/material.dart';
import 'package:levelup_sports_assignment/tabs/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level Up Sports',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const Tabs(),
    );
  }
}