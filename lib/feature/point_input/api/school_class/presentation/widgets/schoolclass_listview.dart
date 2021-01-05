import 'package:fai_kul/feature/point_input/api/class_student/presentation/pages/class_student_page.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/presentation/widgets/search_widget.dart';
import 'package:fai_kul/feature/point_input/api/school_class/domain/entities/school_class_swagger.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchoolClassListview extends StatefulWidget {
  final SchoolClassSwagger data;

  const SchoolClassListview({Key key, this.data}) : super(key: key);
  @override
  _SchoolClassListviewState createState() => _SchoolClassListviewState();
}

class _SchoolClassListviewState extends State<SchoolClassListview> {
  SchoolClassSwagger val;
  
  String filterData = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    val = widget.data;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController _controller = new ScrollController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Container(
            alignment: FractionalOffset.centerLeft ,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0, top: 10, left: 10),
              child:  SearchWidget(
                title: 'Nhập tên trường hoặc lớp',
                onChanged: (s){
                  setState(() {
                    val = widget.data;
                    print("ádadsasd");
                  });
                  print("_SchoolClassListviewState ${s}");
                },
                onSummited: (s){
                  setState(() {
                    if(s == ""){
                      print("onSummitedx ${s}");
                      val = widget.data;
                    } else
                      val.data.items.removeWhere((element) => !element.name.toUpperCase().contains(s.toString().toUpperCase()));
                  });
                },
              ),
            ),
          ),
        Container(
            height: size.height * 0.8,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: _buildListItemsFromitems(val),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              controller: _controller,
            ))
      ],
    );

  }
  
  List<Container> _buildListItemsFromitems(SchoolClassSwagger val) {
    print("_SchoolClassListviewState");
    // list = list.reversed.toList();
    return val.data.items.map((item) {
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClassStudentPage( id: item.id,)),
            );
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
                          '${item.name}',
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
                          '${item.department.name}',
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
