import 'package:fai_kul/feature/dayoff/school_leave_list/domain/entities/school_leave_list_swagger.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchoolLeaveListview extends StatefulWidget {
  final SchoolLeaveListSwagger swagger;

  const SchoolLeaveListview({Key key, this.swagger}) : super(key: key);
  @override
  _SchoolLeaveListviewState createState() => _SchoolLeaveListviewState();
}

class _SchoolLeaveListviewState extends State<SchoolLeaveListview> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController _controller = new ScrollController();
    return Container(
        height: size.height * 0.8,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: _buildListItemsFromitems(widget.swagger.data),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          controller: _controller,
        ));
  }

  List<Container> _buildListItemsFromitems(List<Data> list) {
    list = list.reversed.toList();
    int index = 0;
    return list.map((item) {
      var parseDate = DateTime.parse(item.dateCreated);
      var container = Container(
        margin: EdgeInsets.only(bottom: 7),
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
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.fromLTRB(15,5,0,3),
                      width: 300 ,
                      child: new Text(
                      '${item.reason}',
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    // new Container(
                    //   padding: const EdgeInsets.only(bottom: 10.0),
                    //   child: new Text(
                    //     'Trạng thái: ${trangThai}',
                    //     style: new TextStyle(
                    //         fontWeight: FontWeight.normal,
                    //         fontSize: 15.0,
                    //         color: Colors.black),
                    //   ),
                    // ),
                    new Container(
                      padding: const EdgeInsets.fromLTRB(10,0,0,10),
                      child: new Text(
                        '${parseDate.day}/${parseDate.month}/${parseDate.year}',
                        style: new TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );
      index = index + 1;
      return container;
    }).toList();
  }
}
