import 'package:fai_kul/feature/point_input/api/class_student/domain/entities/class_student.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/presentation/pages/contactbook_page.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/presentation/widgets/search_widget.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassStudentListview extends StatefulWidget {
  final ClassStudentSwagger data;

  const ClassStudentListview({Key key, this.data}) : super(key: key);

  @override
  _ClassStudentListviewState createState() => _ClassStudentListviewState();
}

class _ClassStudentListviewState extends State<ClassStudentListview> {
  @override
  Widget build(BuildContext context) {
    // List<Items> list = List<Items>();
    // list = widget.data.data.items.sort(
    //     (a,b) => a.
    // );
    Size size = MediaQuery.of(context).size;
    ScrollController _controller = new ScrollController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3,),
        Center(
          child: Text(
            "Danh sách học sinh ${widget.data.data.items[0].classx.name}",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        SizedBox(height: 3,),
        Divider(height: 2,),
        SizedBox(height: 3,),
        Container(
          alignment: FractionalOffset.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.0, top: 10, left: 10),
            child:  SearchWidget(
              title: "Nhập tên học sinh",
              onChanged: (s){
                setState(() {
                });
              },
              onSummited: (s){
                setState(() {
                });
              },
            ),
          )
        ),
        Container(
            height: size.height * 0.8,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: _buildListItemsFromitems(widget.data),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              controller: _controller,
            ))
      ],
    );
  }

  List<Container> _buildListItemsFromitems(ClassStudentSwagger data) {
    print("_SchoolClassListviewState");
    // list = list.reversed.toList();
    return data.data.items.map((item) {
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
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactbookPage(id: item.id,)),
                );
              },
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
                              '${item.fullName}',
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
                              '${item.classx.name}',
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
            ),
          ));
      return container;
    }).toList();
  }
}
