import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentPointHeader extends StatefulWidget {
  @override
  _StudentPointHeaderState createState() => _StudentPointHeaderState();
}

class _StudentPointHeaderState extends State<StudentPointHeader> {
  String dropdownButtonVal =  'Học kì 1 năm 2020';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Chọn học kì: ", style: TextStyle(fontSize: 18, color: Colors.black,),),
        new DropdownButton<String>(
          value: dropdownButtonVal,
          items: <String>['Học kì 1 năm 2020', 'Học kì 2 năm 2020'].map((
              String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (s) {
            setState(() {
              dropdownButtonVal = s;
            });
          },
        )
      ],
    );
  }
}