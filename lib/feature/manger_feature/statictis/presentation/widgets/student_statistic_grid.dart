import 'package:fai_kul/feature/manger_feature/statictis/domain/entities/StatisticResponse.dart';
import 'package:flutter/material.dart';

class StudentStatisticGrid extends StatelessWidget {
  final StatisticResponseSwaggger responseSwaggger;
  final String id;
  const StudentStatisticGrid({Key key, this.responseSwaggger, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("StudentStatisticGrid ToDayStudent success");
    if(id == "ToDayStudent"){
      List<Overviews> overviews = responseSwaggger.data.items[0].statisticOverview.overviews;
      Overviews studentData;
      for(var data in overviews){
        print("xasasas ${data.date}");
        DateTime tempday =  DateTime.parse(data.date);
        DateTime now = DateTime.now();
        if(tempday.day == now.day && tempday.month == now.month && tempday.year == now.year ){
          print("StudentStatisticGrid ToDayStudent success");
          studentData = data;
          print("StudentStatisticGrid ToDayStudent success ${studentData.morning.absentStatusNumbers + studentData.afternoon.absentStatusNumbers}");
        }
      }
      return Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          children: <Widget>[
            Flexible(
              child: Row(
                children: <Widget>[
                  _buildStatCard('Số lớp', responseSwaggger.data.items[0].classQuanity.toString(), Colors.green),
                  _buildStatCard('Học sinh', responseSwaggger.data.items[0].statisticOverview.employeeNumbers.toString(), Colors.green),
                  _buildStatCard('Đi học', responseSwaggger.data.items[0].statisticOverview.employeeNumbers.toString(), Colors.green),
                ],
              )
            ),
            Flexible(
              child: Row(
                children: <Widget>[
                  _buildStatCard('Vắng', (studentData.morning.absentStatusNumbers + studentData.afternoon.absentStatusNumbers).toString(), Colors.red),
                  _buildStatCard('Đi trể', (studentData.morning.lateStatusNumbers + studentData.afternoon.lateStatusNumbers).toString(), Colors.orange),
                  _buildStatCard('Bỏ buổi', (studentData.morning.skipStatusNumbers + studentData.afternoon.skipStatusNumbers).toString(), Colors.purple),
                ],
              ),
            ),
          ],
        ),
      );
    }  else  if(id == "WeekStudent") {
      print("StudentStatisticGrid WeekStudent load");
      int absent = 0, late = 0, skip = 0 ;
      for(var i in responseSwaggger.data.items[0].statisticOverview.overviews){
        absent += i.morning.absentStatusNumbers + i.afternoon.absentStatusNumbers;
        late += i.morning.lateStatusNumbers + i.afternoon.lateStatusNumbers;
        skip += i.morning.skipStatusNumbers + i.afternoon.skipStatusNumbers;
      }
      return Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          children: <Widget>[
            Flexible(
              child: Row(
                children: <Widget>[
                  _buildStatCard('Số lớp', responseSwaggger.data.items[0].classQuanity.toString(), Colors.green),
                  _buildStatCard('Giáo viên', responseSwaggger.data.items[0].teacherQuantity.toString(), Colors.green),
                  _buildStatCard('Học sinh', responseSwaggger.data.items[0].statisticOverview.employeeNumbers.toString(), Colors.green),
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: <Widget>[
                  _buildStatCard('Vắng', absent.toString(), Colors.red),
                  _buildStatCard('Đi trể', late.toString(), Colors.orange),
                  _buildStatCard('Bỏ buổi', skip.toString(), Colors.purple),
                ],
              ),
            ),
          ],
        ),
      );
    }

  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
