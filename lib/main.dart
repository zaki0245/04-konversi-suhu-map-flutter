/*  MUHAMMAD ZAKI
    MI 2F
    2031710106 */

import 'package:flutter/material.dart';
import 'package:konversi_suhu_2/widget/dropdown.dart';
import 'package:konversi_suhu_2/widget/input.dart';
import 'package:konversi_suhu_2/widget/konversi.dart';
import 'package:konversi_suhu_2/widget/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double kelvin = 0;
  double reamur = 0;
  double result = 0;
  String selectedDropdown = "kelvin";

  TextEditingController etInput = TextEditingController();

  // ignore: non_constant_identifier_names
  Convert() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (selectedDropdown == "kelvin")
        result = _inputUser + 273;
      else
        result = (4 / 5) * _inputUser;
      listViewItem.add(selectedDropdown + " : " + result.toStringAsFixed(2));
      print(listViewItem);
    });
  }

  onChangedDropdown(String val) {
    setState(() {
      selectedDropdown = val;
    });
  }

  var listSatuanSuhu = ["kelvin", "reamur"];
  List<String> listViewItem = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu 2 By Muhammad Zaki 2031710106"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Input(etInput: etInput),
              Dropdown(
                  selectedDropdown: selectedDropdown,
                  listSatuanSuhu: listSatuanSuhu,
                  onChangedDropdown: onChangedDropdown),
              Konversi(result: result),
              Container(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: Convert,
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: const Text("Konversi Suhu"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Result(listViewItem: listViewItem),
            ],
          ),
        ),
      ),
    );
  }
}
