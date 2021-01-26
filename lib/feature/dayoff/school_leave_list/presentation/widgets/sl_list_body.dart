import 'package:fai_kul/feature/dayoff/school_leave_list/presentation/school_leave_list/school_leave_list_bloc.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/presentation/widgets/shoolleave_listview.dart';
import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SLListBody extends StatefulWidget {
  @override
  _SLListBodyState createState() => _SLListBodyState();
}

class _SLListBodyState extends State<SLListBody> {
  @override
  Widget build(BuildContext context) {
    getSchoolLeaveData();
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
          children: [
            BlocBuilder<SchoolLeaveListBloc, SchoolLeaveListState>(
              builder: (context, state){
                if(state is Empty){
                  return Center(
                    child: Text("Empty") ,
                  );
                } else
                if(state is Loading){
                  return Center(
                    child: LoadingWidget() ,
                  );
                }  else
                if(state is Loaded){
                  print("SLListBody loaded ${state.schoolLeaveListSwagger.data.length}");
                  return SchoolLeaveListview(swagger: state.schoolLeaveListSwagger,);
                }   else
                if(state is Error){
                  return Center(
                    child: Text('Hiện tại chưa có đơn xin nghỉ nào'),
                  );
                }
              },
            ),
          ],
        )
    );
  }

  void getSchoolLeaveData(){
    BlocProvider.of<SchoolLeaveListBloc>(context).add(GetListSchoolLeaveEvent());
  }
}
