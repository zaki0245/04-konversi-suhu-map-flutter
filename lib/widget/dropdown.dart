import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
      {Key? key,
      required this.selectedDropdown,
      required this.listSatuanSuhu,
      required this.onChangedDropdown})
      : super(key: key);

  final String selectedDropdown;
  final List<String> listSatuanSuhu;
  final Function onChangedDropdown;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 120, right: 120, top: 10, bottom: 20),
      child: DropdownButton(
        items: listSatuanSuhu.map((String val) {
          return DropdownMenuItem(
            value: val,
            child: Text(val),
          );
        }).toList(),
        value: selectedDropdown,
        onChanged: (val) {
          onChangedDropdown(val);
        },
        isExpanded: true,
      ),
    );
  }
}
