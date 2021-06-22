import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'detail.dart';
import 'edit.dart';
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
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<String> scanQR() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);

      print("hasil scan : $barcodeScanRes");
      setState(() {
        _scanBarcode = barcodeScanRes;
      });
    } on PlatformException {
      barcodeScanRes = "Something error with scanner";
    }

    var url = Uri.https(
        'isan.nafaarts.com', '/inventaris.php', {'kode': barcodeScanRes});
    try {
      var response = await http.get(url);
      var data = jsonDecode(response.body);

      if (data == null) {
        if (barcodeScanRes != "-1") {
          showAlertDialog(
              context, "Tidak ada data diterima dari $barcodeScanRes");
        }
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detail(
                      data: data,
                      code: barcodeScanRes,
                    )));
      }
    } catch (error) {
      print('WTF');
    }

    return barcodeScanRes;
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

showAlertDialog(BuildContext context, String message) {
  Widget okButton = FlatButton(
    child: Text(
      "back",
      style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.redAccent,
    title: Icon(
      Icons.error,
      size: 50.0,
      color: Colors.white,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
            child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        )),
      ],
    ),
    actions: [okButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
