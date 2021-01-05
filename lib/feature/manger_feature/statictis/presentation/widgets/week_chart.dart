import 'package:fai_kul/feature/manger_feature/statictis/domain/entities/StatisticResponse.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/config/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeekChart extends StatelessWidget {
  final StatisticResponseSwaggger data;
  final String id;
  const WeekChart({@required this.data, this.id});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
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
            width: MediaQuery.of(context).size.width * 0.85,
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
                          DateTime d2 = now.add(Duration(
                            days: -5,
                          ));
                          return "${d2.day}/${d2.month}";
                        case 1:
                          DateTime d3 = now.add(Duration(
                            days: -4,
                          ));
                          return "${d3.day}/${d3.month}";
                        case 2:
                          DateTime d4 = now.add(Duration(
                            days: -3,
                          ));
                          return "${d4.day}/${d4.month}";
                        case 3:
                          DateTime d5 = now.add(Duration(
                            days: -2,
                          ));
                          return "${d5.day}/${d5.month}";
                        case 4:
                          DateTime d6 = now.add(Duration(
                            days: -1,
                          ));
                          return "${d6.day}/${d6.month}";
                        case 5:
                          return "${now.day}/${now.month}";

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
                        double student = data.data.items[0].statisticOverview.employeeNumbers.toDouble()*2/5;
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
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.black12,
                    strokeWidth: 1.0,
                    dashArray: [5],
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups:
                data.data.items[0].statisticOverview.overviews
                    .asMap()
                    .map((key, value) => MapEntry(
                        key,
                        BarChartGroupData(
                          x: key,
                          barRods: [
                            BarChartRodData(
                              y: (value.morning.absentStatusNumbers + value.afternoon.absentStatusNumbers)/data.data.items[0].statisticOverview.employeeNumbers.toDouble() * 15,
                              color: Colors.red,
                            ),
                            BarChartRodData(
                              y: (value.morning.lateStatusNumbers + value.afternoon.lateStatusNumbers)/data.data.items[0].statisticOverview.employeeNumbers.toDouble() * 15,
                              color: Colors.yellow,
                            ),
                            BarChartRodData(
                              y: (value.morning.skipStatusNumbers + value.afternoon.skipStatusNumbers)/data.data.items[0].statisticOverview.employeeNumbers.toDouble() * 15,
                              color: Colors.green,
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
