import 'package:date_format/date_format.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/domain/entities/ContactBookSwagger.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'name_header.dart';

class ContactbookListview extends StatefulWidget {
  final ContactBookSwagger data;

  const ContactbookListview({Key key, this.data}) : super(key: key);

  @override
  _ContactbookListviewState createState() => _ContactbookListviewState();
}

class _ContactbookListviewState extends State<ContactbookListview> {
  @override
  Widget build(BuildContext context) {
    print("duydeptrai ${widget.data.data.length}");
    Size size = MediaQuery.of(context).size;
    ScrollController _controller = new ScrollController();
    return widget.data.data.length > 0?Container(
        height: size.height * 0.8,
        child: Column(
          children: [
            ContactBookHeader(
              name: "${widget.data.data[0].employee.fullName}",
              sClass: "${widget.data.data[0].employee.classx.name}",
            ),
            SizedBox(height: 10),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: _buildListItemsFromitems(widget.data),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              controller: _controller,
            )
          ],
        )): Center(child: Text("Học sinh chưa có dữ liệu"));
  }

  List<Container> _buildListItemsFromitems(ContactBookSwagger val) {
    print("_SchoolClassListviewState");
    // list = list.reversed.toList();
    return val.data.map((item) {
      var container = Container(
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 50),
                blurRadius: 20,
                color: kActiveShadowColor,
              )
            ],
          ),
          child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Tuần ${item.week}",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Text(
                        "${item.comment}",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child:   Icon(Icons.loop),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )));
      return container;
    }).toList();
  }
}
