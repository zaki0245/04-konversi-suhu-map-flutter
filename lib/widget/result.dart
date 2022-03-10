import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.listViewItem}) : super(key: key);

  final List<String> listViewItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          children: listViewItem.map((String val) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Text(
            val,
            style: TextStyle(fontSize: 15),
          ),
        );
      }).toList()),
    );
  }
}
