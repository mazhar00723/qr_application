import 'package:flutter/material.dart';
import 'package:qr_app/registration.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter you roll no',
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Password',
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor:  Colors.transparent),
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Registration()),
                );},
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
              Text(style: TextStyle(fontSize: 20, color: Colors.white), 'Heyy mannn'),

            ],
          ),
        );
  }
}
