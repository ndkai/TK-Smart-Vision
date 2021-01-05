import 'package:fai_kul/feature/point_input/api/contact_book/data/data_sources/create_contact_book.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/presentation/pages/contactbook_page.dart';
import 'package:fai_kul/feature/study_point/domain/entities/studypoin_swagger.dart';
import 'package:flutter/material.dart';

import 'dropdown_widget.dart';

showAddCbookDialog(BuildContext context) {
  TextEditingController weekText = TextEditingController();
  TextEditingController comment = TextEditingController();
  var alert = new AlertDialog(
    content:  SingleChildScrollView(
      child: Container(
        height: context.size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Thêm mới"),
            Row(
              children: [
                Text("Học kì:    "),
                DropDownWidget(),
              ],
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: weekText,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Tuần"
                )
            ), TextFormField(
              controller: comment,
                decoration: InputDecoration(
                    labelText: "Đánh giá"
                )
            )

          ],
        ),
      ),
    ),
    backgroundColor: Colors.white,

    actions: <Widget>[
      new FlatButton(
        child: Text("OK", style: TextStyle(fontSize: 20, color: Colors.greenAccent),),
        onPressed: () async {
          bool result = await createContactBook(int.parse(weekText.text.toString()),1,comment.text);
          if(result == true){
            Navigator.pop(context);
            _showSuccessfulDialog(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactbookPage(id: currentContactBookId,)),
            );
          } else{
            Navigator.pop(context);

          }

        },
      )
    ],
  );
  showDialog(
      context: context,
      builder: (context) {
        return alert;
      });
}


void _showSuccessfulDialog(BuildContext context) {
  print("_showSuccessfulDialog");
  var alert = new AlertDialog(
    backgroundColor: Colors.white,
    title:  Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/yes_icon.png"),
          SizedBox(height: 5,),
          Text("Thành công", style: TextStyle(fontSize: 30),),
          SizedBox(height: 10,),
          Text("Thêm sổ liên lạc mới thành công", style: TextStyle(fontSize: 20),),
        ],
      ),
    ),
    actions: <Widget>[
      new FlatButton(
        child: Text("OK", style: TextStyle(fontSize: 20, color: Colors.greenAccent),),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
  showDialog(
      context: context,
      builder: (context) {
        return alert;
      });
}

void _showFailedDialog(BuildContext context) {
  print("_showSuccessfulDialog");
  var alert = new AlertDialog(
    backgroundColor: Colors.white,
    title:  Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/uncheck.png"),
          SizedBox(height: 5,),
          Text("Thất bại", style: TextStyle(fontSize: 30),),
          SizedBox(height: 10,),
          Text("Có lỗi xảy ra", style: TextStyle(fontSize: 20),),
        ],
      ),
    ),
    actions: <Widget>[
      new FlatButton(
        child: Text("OK", style: TextStyle(fontSize: 20, color: Colors.greenAccent),),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
  showDialog(
      context: context,
      builder: (context) {
        return alert;
      });
}