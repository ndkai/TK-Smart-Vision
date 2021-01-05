import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> semesters = ['Học kì 1 - 2020', 'Học kì 2 - 2020', 'Học kì 1 - 2021', 'Học kì 2 - 2021'];

class DropDownWidget extends StatefulWidget {
  final List<String> list;

  const DropDownWidget({Key key, this.list}) : super(key: key);
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String title = "";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: semesters.map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      hint:Text(title),
      onChanged: (string) { setState(() {
        title = string;
      });},
    );
  }
}
