import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final ValueChanged onChanged;
  final ValueChanged onSummited;
  final String title;

  const SearchWidget({Key key, this.onChanged, this.onSummited, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.4,
        height: size.height * 0.05,
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blueAccent)),
        child: Center(
          child: TextField(
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 13),
              hintText: title,
              suffixIcon: Icon(Icons.search),
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 15 ),
            ),
            onChanged: onChanged,
            onSubmitted: onSummited,
          ),
        ));
  }
}
