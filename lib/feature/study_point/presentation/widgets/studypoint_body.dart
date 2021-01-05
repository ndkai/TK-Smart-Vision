import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/login/presentation/widgets/message_display.dart';
import 'package:fai_kul/feature/study_point/presentation/manager/study_point/study_point_bloc.dart';
import 'package:fai_kul/feature/study_point/presentation/pages/DetailPointPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudyPointBody extends StatefulWidget {
  @override
  _StudyPointBodyState createState() => _StudyPointBodyState();
}

class _StudyPointBodyState extends State<StudyPointBody> {
  @override
  Widget build(BuildContext context) {
    getStudyPoint();
    return Container(
      child: Column(
        children: [
        BlocBuilder<StudyPointBloc, StudyPointState>(
        builder: (context, state){
             if(state is Empty){
                  return MessageDisplay(message: "Thông tin trống");
             } else
               if(state is Loading){
                 return LoadingWidget();
               } else
                 if(state is Loaded){
                    return DetailPointPage(data: state.point,);
                 }  else
                   if(state is Error){
                     return MessageDisplay(message: "Có lỗi xãy ra, vui lòng thử lại!");
                   }
        })
        ],
      ),
    );
  }

  void getStudyPoint(){
    BlocProvider.of<StudyPointBloc>(context).add(GetStudyPoint());
  }
}
