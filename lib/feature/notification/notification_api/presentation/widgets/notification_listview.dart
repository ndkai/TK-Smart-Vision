import 'package:fai_kul/feature/point_input/api/school_class/domain/entities/school_class_swagger.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NotificationListview extends StatefulWidget {
  @override
  _NotificationListviewState createState() => _NotificationListviewState();
}

class _NotificationListviewState extends State<NotificationListview> {
  final double functionTextSize = 20;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listBody(),
        SizedBox(
          height: 5,
        ),
        listBody(),
        SizedBox(
          height: 5,
        ),
        listBody(),
      ],
    );
  }

  Widget listBody() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 50),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              notiTitle(),
              timeAndTool(),
            ],
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text("  Nhiệm vụ xong rồi nhận qua thôi!",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("  Bạn nhận được 5 lược lắc hãy vào lắc thôi nào"),
              SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget notiTitle() {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Image.asset(
            "assets/icons/kids.png",
            height: 30,
            width: 30,
          ),
          Text(
            "  Lắc xì",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget timeAndTool() {
    return Container(
      child: Row(
        children: [
          Text("11 giờ trước    ",
              style: TextStyle(fontWeight: FontWeight.bold)),
          GestureDetector(
            child: Image.asset(
              "assets/icons/3_dots_icon.png",
              height: 20,
              width: 20,
            ),
            onTap: () {
              showMaterialModalBottomSheet(
                context: context,
                builder: (context) => SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: notiFunction()
                ),
              );
            },
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget notiFunction() {
    return Container(
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              child: Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Row(
                    children: [
                      Image.asset( "assets/icons/check_icon.png", height: functionTextSize, width: functionTextSize,),
                      Text("   Đánh dấu đã đọc", style: TextStyle(fontSize: functionTextSize),),
                    ],
                  )
              ),
            ),
          ),
          Divider(height: 2,),
          Material(
            color: Colors.transparent,
            child: InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                child: Row(
                  children: [
                    Image.asset( "assets/icons/heart_icon.png", height: functionTextSize, width: functionTextSize,),
                    Text("   Bỏ quan tâm", style: TextStyle(fontSize: functionTextSize),),
                  ],
                )
              ),
            ),
          ),
          Divider(height: 2,),
          Material(
            color: Colors.transparent,
            child: InkWell(
              child: Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Row(
                    children: [
                      Image.asset( "assets/icons/trash_icon.png", height: functionTextSize, width: functionTextSize,),
                      Text("   Xóa", style: TextStyle(fontSize: functionTextSize),),
                    ],
                  )
              ),
            ),
          ),
          Divider(height: 2,),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Row(
                    children: [
                      Image.asset( "assets/icons/close_icon.png", height: functionTextSize, width: functionTextSize,),
                      Text("   Hủy", style: TextStyle(fontSize: functionTextSize),),
                    ],
                  )
              ),
            ),
          ),
          Divider(height: 2,),
        ],
      ),
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
              onTap: () {}, // handle your onTap here
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Container(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 3),
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
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
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
              )),
        ),
      );
      return container;
    }).toList();
  }
}
