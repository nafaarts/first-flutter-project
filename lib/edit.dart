import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kbpna_inventory/detail.dart';
import 'package:http/http.dart' as http;

class edit extends StatefulWidget {
  final String code;
  final String kondisi;
  final String nama_barang;
  final String gambar;
  const edit(
      {Key? key,
      required this.code,
      required this.kondisi,
      required this.gambar,
      required this.nama_barang})
      : super(key: key);

  @override
  _editState createState() => _editState(code, kondisi, nama_barang, gambar);
}

class _editState extends State<edit> {
  String dropdownValue = "BAGUS";
  String code = "null";
  String nama_barang = "null";
  String gambar = "null";

  _editState(String code, String kondisi, String nama_barang, String gambar) {
    this.dropdownValue = kondisi.toUpperCase();
    this.code = code;
    this.nama_barang = nama_barang;
    this.gambar = gambar;
  }

  final securityCode = TextEditingController();

  Future editDataFromAPI(String code, String kondisi, String security) async {
    var url = Uri.parse('https://isan.nafaarts.com/update.php');
    var response = await http.post(url, body: {
      'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
      'code': code,
      'kondisi': kondisi,
      'security': security
    });
    var responseData = jsonDecode(response.body);

    if (responseData['response'] == 200) {
      showAlertDialog(context, code, Colors.amberAccent, responseData['msg']);
    } else {
      showAlertDialog(context, code, Colors.red.shade300, responseData['msg']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              "EDIT DATA",
              style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(height: 60.0),
          Padding(
            padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(image: NetworkImage(gambar)),
            ),
          ),
          Divider(height: 30.0),
          Padding(
            padding: EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "NAMA BARANG",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  nama_barang,
                  style: TextStyle(color: Colors.amberAccent, fontSize: 20.0),
                ),
                SizedBox(height: 30.0),
                Text(
                  "KONDISI",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 400.0,
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        value: dropdownValue,
                        style: const TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 20.0,
                        ),
                        items: <String>['BAGUS', 'RUSAK']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  "KODE KEAMANAN",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: securityCode,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.amberAccent,
                  ),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Masukan Kode Keamanan',
                    prefixIcon: const Icon(
                      Icons.security,
                      color: Colors.amberAccent,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(height: 30.0),
          Padding(
            padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.amberAccent,
                  child: Row(
                    // Replace with a Row for horizontal icon + text
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.arrow_back),
                      SizedBox(width: 10.0),
                      Text("BACK")
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    String security = securityCode.text;
                    editDataFromAPI(code, dropdownValue, security);
                    // showAlertDialog(context);
                  },
                  color: Colors.amberAccent,
                  child: Row(
                    // Replace with a Row for horizontal icon + text
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.save),
                      SizedBox(width: 10.0),
                      Text("SAVE")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

showAlertDialog(
    BuildContext context, String code, Color warna, String message) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () async {
      var url =
          Uri.https('isan.nafaarts.com', '/inventaris.php', {'kode': code});
      try {
        var response = await http.get(url);
        var data = jsonDecode(response.body);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detail(
                      data: data,
                      code: code,
                    )));
      } catch (error) {
        print('WTF');
      }
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: warna,
    title: Icon(
      Icons.message,
      size: 50.0,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: Text(message)),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
