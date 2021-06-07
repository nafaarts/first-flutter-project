import 'package:flutter/material.dart';
import 'package:kbpna_inventory/detail.dart';

class edit extends StatefulWidget {
  const edit({Key? key}) : super(key: key);

  @override
  _editState createState() => _editState();
}

class _editState extends State<edit> {
  String dropdownValue = "BAGUS";

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
              child: Image(
                  image: NetworkImage(
                      'https://m.ayojakarta.com/images-jakarta/post/articles/2019/07/23/2548/ruko.jpg')),
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
                  "RUKO SEWA",
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
                    showAlertDialog(context);
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

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      // Navigator.push(
      // context,
      // MaterialPageRoute(
      //     builder: (context) => detail(
      //           gambar: "null",
      //           qrresult: "null",
      //         )));
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.amberAccent,
    title: Icon(
      Icons.check,
      size: 50.0,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: Text("Data Berhasil Diubah!")),
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
