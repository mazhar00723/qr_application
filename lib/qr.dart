import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
class Qr extends StatefulWidget {
  const Qr({Key? key}) : super(key: key);

  @override
  State<Qr> createState() => _QrState();
}

class _QrState extends State<Qr> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          children: [
            Icon(Icons.account_circle,size: 80,),
            SizedBox(
              height: 100,
            ),

            QrImageView(
              data: '1234567890',
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              onPressed: () {

              },
              child: Container(
                width: 150,
                height: 40,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text('Scan'),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
