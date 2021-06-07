import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'detail.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Home(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);

      var myURL = Uri.https('jsonplaceholder.typicode.com', '/photos/1');
      var req = await http.get(myURL);

      var data;

      setState(() {
        data = json.decode(req.body);
      });

      if (barcodeScanRes != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => detail(data: data)));
      }
    } on Exception {
      barcodeScanRes = "Something error";
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/logo_kanwil_inventory.png"),
            ),
            Divider(
              height: 60.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                "KANWIL BPN ACEH",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            Center(
              child: Text(
                "INVENTORY",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              height: 60.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: FlatButton(
                onPressed: () => scanQR(),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  // Replace with a Row for horizontal icon + text
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.qr_code),
                    SizedBox(width: 10.0),
                    Text("SCAN A GOODS")
                  ],
                ),
                color: Colors.amberAccent,
              ),
            ),
            SizedBox(
              height: 90.0,
            ),
            Center(
              child: Text(
                "Copyright © TA 2021",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
