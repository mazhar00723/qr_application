import 'package:flutter/material.dart';
import 'package:qr_app/login.dart';
import 'package:qr_app/qr.dart';
import 'package:qr_app/registration.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _qr_appState();
}

class _qr_appState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Registration()
    );
  }
}

