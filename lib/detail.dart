import 'package:flutter/material.dart';
import 'package:kbpna_inventory/main.dart';
import 'edit.dart';

class detail extends StatelessWidget {
  final data;
  const detail({Key? key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "DETAIL DATA",
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
              child: Image(image: NetworkImage(data['url'])),
            ),
          ),
          Divider(
            height: 1.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(70.0, 40.0, 50.0, 20.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "NAMA BARANG",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "RUKO SEWA",
                            style: TextStyle(
                                color: Colors.amberAccent, fontSize: 20.0),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "ASAL PEROLEH",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "HIBAH BRR",
                            style: TextStyle(
                                color: Colors.amberAccent, fontSize: 20.0),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "TANGGAL PEROLEH",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "2012-07-20",
                            style: TextStyle(
                                color: Colors.amberAccent, fontSize: 20.0),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "RUPIAH ASET",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "Rp 198.500.000",
                            style: TextStyle(
                                color: Colors.amberAccent, fontSize: 20.0),
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "TEMPAT ASET",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "-",
                              style: TextStyle(
                                  color: Colors.amberAccent, fontSize: 20.0),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              "MERK BARANG",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "-",
                              style: TextStyle(
                                  color: Colors.amberAccent, fontSize: 20.0),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              "KONDISI",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "BAGUS",
                              style: TextStyle(
                                  color: Colors.amberAccent, fontSize: 20.0),
                            ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => edit()),
                    );
                  },
                  color: Colors.amberAccent,
                  child: Row(
                    // Replace with a Row for horizontal icon + text
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.edit),
                      SizedBox(width: 10.0),
                      Text("EDIT")
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
