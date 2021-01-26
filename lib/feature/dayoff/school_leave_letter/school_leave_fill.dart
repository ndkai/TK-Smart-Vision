import 'package:fai_kul/feature/login/presentation/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'school_leave_body.dart';

class SchoolLeaveFill extends StatefulWidget {
  @override
  _SchoolLeaveFillState createState() => _SchoolLeaveFillState();
}

class _SchoolLeaveFillState extends State<SchoolLeaveFill> {
  TextEditingController addressEdt = TextEditingController();
  TextEditingController relationEdt = TextEditingController();
  TextEditingController fromdayEdt = TextEditingController();
  TextEditingController todayEdt = TextEditingController();
  TextEditingController reasonEdt = TextEditingController();
  bool addressError = true;
  bool relationError = true;
  bool fromdayError = true;
  bool todayError = true;
  bool reasonError = true;
  DateTime fromday;
  DateTime today;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: body(),
    );
  }

  Widget body() {
    return Column(
      children: [
        SizedBox(height: 10,),
        fillWidget(addressEdt, "Địa chỉ", addressError, Icons.home_filled),
        SizedBox(height: 10,),
        fillWidget(relationEdt, "Quan hệ", relationError, Icons.person),
        SizedBox(height: 10,),
        dayFillWidget(fromdayEdt, "Nghỉ từ ngày", fromdayError, Icons.today),
        SizedBox(height: 10,),
        dayFillWidget(todayEdt, "Đến ngày", todayError, Icons.today_rounded),
        SizedBox(height: 10,),
        fillWidget(reasonEdt, "Lý do", reasonError, Icons.message),
        SizedBox(height: 10,),
        RoundedButton(
          text: "Xác nhận",
          color: Colors.blue,
          press: () async {
            if(addressEdt.text == ""){
               setState(() {
                 addressError = false;
               });
            }

            if(relationEdt.text == ""){
              setState(() {
                relationError = false;
              });
            }

            if(todayEdt.text == ""){
              setState(() {
                todayError = false;
              });
            }

            if(fromdayEdt.text == ""){
              setState(() {
                fromdayError = false;
              });
            }

            if(reasonEdt.text == ""){
              setState(() {
                reasonError = false;
              });
            }
            if(addressEdt.text != "" && fromdayEdt.text != "" && todayEdt.text != "" && reasonEdt.text != "" && relationEdt.text != "")
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SchoolLeaveBody(
                key: schoolLeaveBodyKey,
                address: addressEdt.text,
                relation: addressEdt.text,
                fromDay: fromday,
                toDay: today,
                reason: reasonEdt.text,
              )),
            );
          },
        )
      ],
    );
  }

  Widget fillWidget(TextEditingController controller, String label,
      bool isError, IconData icon) {
    return TextFormField(
      controller: controller,
      cursorColor: Theme.of(context).cursorColor,
      // maxLength: 20,
      decoration: !isError
          ? InputDecoration(
              errorText: "Vui lòng nhập thông tin",
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.error,
              ),
              labelText: label,
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            )
          : InputDecoration(
              // errorText: Error message':"",
              // border: OutlineInputBorder(),
              // suffixIcon: Icon(
              //   Icons.error,
              // ),

              labelText: label,
              icon: Icon(icon),
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
    );
  }

  Widget dayFillWidget(TextEditingController controller, String label,
      bool isError, IconData icon) {
    return TextFormField(
      onTap: () {
        _selectDate(context, label);
      },
      keyboardType: TextInputType.datetime,
      showCursor: true,
      readOnly: true,
      controller: controller,
      cursorColor: Theme.of(context).cursorColor,
      // maxLength: 20,
      decoration: !isError
          ? InputDecoration(
              errorText: "Vui lòng nhập thông tin",
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.error,
              ),
              labelText: label,
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            )
          : InputDecoration(
              // errorText: Error message':"",
              // border: OutlineInputBorder(),
              // suffixIcon: Icon(
              //   Icons.error,
              // ),

              labelText: label,
              icon: Icon(icon),
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
    );
  }

  Future<Null> _selectDate(BuildContext context, String key) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2020),
        lastDate: DateTime(2022));
    if (picked != null) {
      setState(() {
        if(key == "Nghỉ từ ngày"){
          fromdayEdt.text = "${picked.day} - ${picked.month} - ${picked.year}";
          fromday =  picked;
        } else
        if(key == "Đến ngày"){
          todayEdt.text = "${picked.day} - ${picked.month} - ${picked.year}";
          today =  picked;
        }

      });
    }
  }
}
