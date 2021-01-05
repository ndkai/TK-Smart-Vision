
import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/login/presentation/widgets/message_display.dart';
import 'package:fai_kul/feature/teacher_attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/teacher_attendance_his/presentation/manager/tattendance_his/tattendance_his_bloc.dart';
import 'package:fai_kul/main/component/DateButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tattendance_his_listview.dart';

class TAttendanceHisBody extends StatefulWidget {
  static DateTime startDay;
  static DateTime endDay;
  static List<TAttendanceHistory> currentList;
  @override
  _TAttendanceHisBodyState createState() => _TAttendanceHisBodyState();
}

class _TAttendanceHisBodyState extends State<TAttendanceHisBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height*0.9,
        width: size.width,
        child:Column(
          children: <Widget>[
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                DateButton(title: 'From Day', className: "_AttendanceHisBodyState",),
                DateButton(title: 'To Day', className: "_AttendanceHisBodyState",),
                OutlineButton(
                  child: new Text("Lọc", style: TextStyle(color: Colors.black, fontSize: 14)),
                  onPressed: (){
                    print('yyyyyy ${TAttendanceHisBody.startDay}');
                   filterAH();
                  },
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.blue,
                )
              ],
            ),
            SizedBox(height: 10),
            BlocBuilder<TAttendanceHisBloc, TAttendanceHisState>(
              builder: (context, state) {
                if (state is Empty) {
                  print("du me flutter");
                  dispatchListHistoies();
                  return MessageDisplay(
                    message: 'Start searching!',
                  );
                } else if (state is Loading) {
                  return Center(
                    child:LoadingWidget() ,
                  );
                } else if (state is Loaded) {
                  TAttendanceHisBody.currentList = state.attendanceHistories;
                  ///ta lọc list theo người ở  đây
                 // return TAttenDanceHisListview(key: historyListKey,list: state.attendanceHistories);
                 return TAttenDanceHisListview(key: historyListKey,list: state.attendanceHistories);
                } else if (state is Error) {
                  return MessageDisplay(message: "Hiện tại chưa có thông tin");
                } else{
                  if(state is FilterAHState){
                    print("oooooo+${state.attendanceHistories.length}");
                    return new TAttenDanceHisListview(key: historyListKey,list: state.attendanceHistories,);
                  }
                }
                return Container();
              },
            )
          ],
        )

    );
  }

  void dispatchListHistoies() {

    BlocProvider.of<TAttendanceHisBloc>(context).add(GetListAH());
  }

  void filterAH(){
    if(TAttendanceHisBody.startDay != null && TAttendanceHisBody.endDay != null && TAttendanceHisBody.currentList != null){
      print("1111333");
      BlocProvider.of<TAttendanceHisBloc>(context)
          .add(FilterAHEvent(TAttendanceHisBody.startDay, TAttendanceHisBody.endDay, TAttendanceHisBody.currentList));
    }
  }
  
}
