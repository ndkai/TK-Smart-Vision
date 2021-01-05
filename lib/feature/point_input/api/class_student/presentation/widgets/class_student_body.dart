import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/login/presentation/widgets/message_display.dart';
import 'package:fai_kul/feature/point_input/api/class_student/presentation/manager/class_student/class_student_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'classstudent_listview.dart';

class ClassStudentBody extends StatefulWidget {
  final int id;

  const ClassStudentBody({Key key, this.id}) : super(key: key);
  @override
  _ClassStudentBodyState createState() => _ClassStudentBodyState();
}

class _ClassStudentBodyState extends State<ClassStudentBody> {
  @override
  Widget build(BuildContext context) {
    getStudent();
    return Container(
      child: Column(
        children: [
          BlocBuilder<ClassStudentBloc, ClassStudentState>(
              builder: (context, state){
                if(state is Empty){
                  return MessageDisplay(message: "Thông tin trống");
                } else
                if(state is Loading){
                  return LoadingWidget();
                } else
                if(state is Loaded){
                  return ClassStudentListview(data: state.studentSwagger,);
                }  else
                if(state is Error){
                  return MessageDisplay(message: "Có lỗi xãy ra, vui lòng thử lại!");
                }
              })
        ],
      ),
    );
  }

  void getStudent(){
    BlocProvider.of<ClassStudentBloc>(context).add(GetClassStudentEvent(id: widget.id));
  }
}
