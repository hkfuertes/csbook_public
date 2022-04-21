import 'package:flutter/material.dart';
import 'package:landing/pages/main_adaptative.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catholic Song Book',
      theme: ThemeData.dark(),
      home: const MainAdaptative(),
    );
  }
}
