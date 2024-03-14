import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
class Qr extends StatelessWidget {
  const Qr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          children: [
            Icon(Icons.account_circle,size: 30,),

            QrImage(
              data: '1234567890',

              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }

}


