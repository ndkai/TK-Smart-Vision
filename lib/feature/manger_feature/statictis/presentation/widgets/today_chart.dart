import 'package:fai_kul/feature/manger_feature/statictis/domain/entities/StatisticResponse.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/config/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class DayCheck{
  final int morning;
  final int evening;

  DayCheck(this.morning, this.evening);
}
class TodayChart extends StatelessWidget {
  final StatisticResponseSwaggger data;
  final String id;

  const TodayChart({@required this.data, this.id});

  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    final List<DayCheck> listVal= List<DayCheck>();
    if (id == "ToDayOverall") {
      List<Overviews> overviews = data.data.items[0].statisticOverview
          .overviews;
      Overviews studentData;
      for (var data in overviews) {
        DateTime tempday = DateTime.parse(data.date);
        DateTime now = DateTime.now();
        if (tempday.day == now.day && tempday.month == now.month &&
            tempday.year == now.year) {
          print("TodayChart ToDayOverall success");
          studentData = data;
          listVal.add(DayCheck(data.morning.absentStatusNumbers, data.afternoon.absentStatusNumbers));
          listVal.add(DayCheck(0,0));
          listVal.add(DayCheck(0,0));
          listVal.add(DayCheck(data.morning.lateStatusNumbers, data.afternoon.lateStatusNumbers));
          listVal.add(DayCheck(0, 0)) ;
          listVal.add(DayCheck(0, 0)) ;
          listVal.add(DayCheck(data.morning.skipStatusNumbers, data.afternoon.skipStatusNumbers)) ;
          print("TodayChart ToDayOverall success absent ${listVal.length}");
        }
      }
      // [absent * 1.0, 0.0, 0.0, late * 1.0, 0.0, 0.0, skip * 1.0]


      return Container(
        height: 350.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Biểu đồ',
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.85,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 16.0,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      margin: 10.0,
                      showTitles: true,
                      textStyle: Styles.chartLabelsTextStyle,
                      // rotateAngle: 35.0,
                      getTitles: (double value) {
                        print("xaaxax ${value}");
                        switch (value.toInt()) {
                          case 0:
                            DateTime d1 = now.add(Duration(
                              days: -6,
                            ));
                            return "Nghỉ học";
                          case 1:
                            DateTime d2 = now.add(Duration(
                              days: -5,
                            ));
                            return " ";
                          case 2:
                            DateTime d3 = now.add(Duration(
                              days: -4,
                            ));
                            return " ";
                          case 3:
                            DateTime d4 = now.add(Duration(
                              days: -3,
                            ));
                            return "Trể học";
                          case 4:
                            DateTime d5 = now.add(Duration(
                              days: -2,
                            ));
                            return " ";
                          case 5:
                            DateTime d6 = now.add(Duration(
                              days: -1,
                            ));
                            return " ";
                          case 6:
                            return "Bỏ tiết";

                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(
                        margin: 10.0,
                        showTitles: true,
                        textStyle: Styles.chartLabelsTextStyle,
                        getTitles: (value) {
                          print("xaaxax1 ${value}");
                          double student = data.data.items[0].statisticOverview
                              .employeeNumbers.toDouble() / 5;
                          if (value == 0) {
                            return '0';
                          } else if (value % 3 == 0) {
                            return '${(value ~/ 3 * student).toInt()}';
                          }
                          return '';
                        }),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value) => value % 3 == 0,
                    getDrawingHorizontalLine: (value) =>
                        FlLine(
                          color: Colors.black12,
                          strokeWidth: 1.0,
                          dashArray: [5],
                        ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups:
                  listVal
                      .asMap()
                      .map((key, value) =>
                      MapEntry(
                          key,
                          BarChartGroupData(
                            x: key,
                            barRods: [
                              BarChartRodData(
                                y: value.morning /  data.data.items[0].statisticOverview
                                    .employeeNumbers.toDouble() * 15,
                                color: Colors.red,
                              ),

                              BarChartRodData(
                                y: value.evening /  data.data.items[0].statisticOverview
                                    .employeeNumbers.toDouble() * 15,
                                color: Colors.yellowAccent,
                              ),
                             
                            ],
                          )))
                      .values
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}