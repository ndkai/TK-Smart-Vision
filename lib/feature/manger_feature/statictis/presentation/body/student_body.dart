import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/login/presentation/widgets/message_display.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/statistic/statistic_bloc.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/widgets/student_statistic_grid.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/widgets/today_chart.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/widgets/week_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/overall_statistic_gird.dart';

class StudentBody extends StatefulWidget {
  final String id;

  const StudentBody({Key key, this.id}) : super(key: key);
  @override
  _StudentBodyState createState() => _StudentBodyState();
}

class _StudentBodyState extends State<StudentBody> {
  @override
  Widget build(BuildContext context) {
    getOverallData();
    return Column(
      children: [
        BlocBuilder<StatisticBloc, StatisticState>(
            builder: (context, state){
              if(state is Empty){
                return MessageDisplay(message: "Vui lòng thử lại sau");
              } else
              if(state is Loading){
                return LoadingWidget();
              } else
              if(state is Loaded){
                print("_OverallBodyState${state.statisticResponseSwaggger.data.items.length}");
                print("_OverallBodyState ${widget.id}");

                if(widget.id == "ToDayStudent"){
                  return Column(
                    children: [
                      StudentStatisticGrid(responseSwaggger: state.statisticResponseSwaggger, id: widget.id,),
                      TodayChart(data: state.statisticResponseSwaggger, id: "ToDayOverall",),
                    ],
                  );
                } else

                if(widget.id == "WeekStudent"){
                  return Column(
                    children: [
                      StudentStatisticGrid(responseSwaggger: state.statisticResponseSwaggger, id: widget.id,),
                      WeekChart(data: state.statisticResponseSwaggger, id: "WeekOverall",),
                    ],
                  );
                }
              }
            }
        )
      ],
    );
  }

  void getOverallData(){
    BlocProvider.of<StatisticBloc>(context).add(GetStatistic());
  }
}
