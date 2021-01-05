import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactBookHeader extends StatelessWidget {
  final String name;
  final String sClass;

  const ContactBookHeader({Key key, this.name, this.sClass}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
         children: [
           Text("${name}", style: TextStyle(fontSize: 20, color: Colors.black),),
           Text("${sClass}", style: TextStyle(fontSize: 15, color: Colors.grey),),
         ],
        ),
      ),
    );
  }
}
