// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class Inventaris {
//   late String id;
//   late String nama_barang;
//   late String tgl_peroleh;
//   late String asal_perolehan;
//   late String rupiah_aset;
//   late String tempat_aset;
//   late String merk_barang;
//   late String kondisi;
//   late String gambar;

//   Inventaris(this.id, this.nama_barang, this.tgl_peroleh, this.asal_perolehan,
//       this.rupiah_aset, this.tempat_aset, this.kondisi, this.gambar);

//   factory Inventaris.createInventaris(Map<String, dynamic> object) {
//     return Inventaris(
//         object['id'],
//         object['nama_barang'],
//         object['tgl_peroleh'],
//         object['asal_perolehan'],
//         object['rupiah_aset'],
//         object['tempat_aset'],
//         object['kondisi'],
//         object['gambar']);
//   }

//   static Future<Inventaris> connectToAPI(String code) async {
//     var myURL =
//         Uri.https('https://isan.nafaarts.com/', 'inventaris.php?kode=' + code);
//     var response = await http.get(myURL);
//     var jsonObject = json.decode(response.body);
//     // var InventarisData = (jsonObject as Map<String, dynamic>)['data'];

//     return Inventaris.createInventaris(jsonObject);
//   }
// }
