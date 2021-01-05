import 'package:fai_kul/feature/point_input/api/school_class/domain/entities/school_class_swagger.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/material.dart';

class NotificationListview extends StatefulWidget {
  
  @override
  _NotificationListviewState createState() => _NotificationListviewState();
}

class _NotificationListviewState extends State<NotificationListview> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            margin: new EdgeInsets.all(10.0),
            child: Image.asset("assets/icons/checkout_icon.png"),
          ),
          Column(
            children: [
              SizedBox(height: 10,),
              Text("Điểm thưởng", style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),),
              Text("Bạn được cộng 176 điểm cho giao dịch tại tiki ", style:  TextStyle(fontSize: 14),),
              Text("Bạn được cộng 176 điểm cho giao dịch tại tiki ",style:  TextStyle(fontSize: 14, color: Colors.lightBlue), ),
            ],
          )
        ],
      )
    );
  }

  List<Container> _buildListItemsFromitems(List<String> val) {
    print("_SchoolClassListviewState");
    // list = list.reversed.toList();
    return val.map((item) {
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
          child: InkWell(
              onTap: () {
              }, // handle your onTap here
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Container(
                            padding: const EdgeInsets.fromLTRB(15,0,15,3),
                            child: new Text(
                              '${item}',
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
                          new Container(
                            padding: const EdgeInsets.fromLTRB(15,0,15,5),
                            child: new Text(
                              '${item}',
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
              )
          ),
        ),
      );
      return container;
    }).toList();
  }
}
