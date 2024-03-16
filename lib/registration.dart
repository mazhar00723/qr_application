import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_app/login.dart';
import 'package:qr_app/qr.dart';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _rolnoController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;

  void register() async {
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/register');
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'name': _nameController.text,
          'roll no': _rolnoController.text,
          'e mail': _emailController.text,
          'password': _passwordController.text
        }));
    print(response.statusCode);
    print(response.body);
    var data =jsonDecode(response.body);
    print(data["messege"]);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()),
      );
    }
    else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data["message"])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              style: TextStyle(fontSize: 40, color: Colors.white),
              'Registration'),
          SizedBox(
            height: 100,
          ),
          TextField(
            controller: _nameController,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your name :',
            ),
          ),
          TextField(
            controller: _rolnoController,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your Roll no :',
            ),
          ),
          TextField(
            controller: _emailController,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your Email:',
            ),
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your password.:',
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {
              register();
            },
            child: Container(
              width: 150,
              height: 40,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Text('Register'),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
