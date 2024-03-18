import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:qr_app/qr.dart';
import 'package:qr_app/registration.dart';
import 'package:http/http.dart' as http;


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final rolnoController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> login(BuildContext context) async {
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/login');
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'rollno':  rolnoController.text,
          'password': passwordController.text,
        }));
    print(response.body);

    var decodedata =jsonDecode(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Qr()),
      );
    }
    else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(decodedata["message"])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(style: TextStyle(fontSize: 40, color: Colors.white), 'Login'),
          SizedBox(
            height: 100,
          ),
          TextField(
            controller: rolnoController,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter you roll no',
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your Password',
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style:
            ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
            onPressed: () {
              login(context);
            },
            child: Container(
              width: 150,
              height: 40,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Text('LOGIN'),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Text(
              style: TextStyle(fontSize: 20, color: Colors.white),
              'dont have account,please register'),
        ],
      ),
    );
  }
}


