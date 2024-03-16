import 'package:flutter/material.dart';
import 'package:qr_app/qr.dart';
import 'package:qr_app/registration.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Registration()
    );
  }
}
