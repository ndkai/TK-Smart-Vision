import 'package:fai_kul/feature/login/presentation/components/rounded_input_field.dart';
import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/login/presentation/widgets/message_display.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/presentation/widgets/search_widget.dart';
import 'package:fai_kul/feature/point_input/api/school_class/presentation/manager/school_class/school_class_bloc.dart';
import 'package:fai_kul/feature/point_input/api/school_class/presentation/widgets/schoolclass_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchoolClassBody extends StatefulWidget {
  @override
  _SchoolClassBodyState createState() => _SchoolClassBodyState();
}

class _SchoolClassBodyState extends State<SchoolClassBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BlocBuilder<SchoolClassBloc, SchoolClassState>(
              builder: (context, state){
                if(state is Empty){
                  getClass();
                  return MessageDisplay(message: "Thông tin trống");
                } else
                if(state is Loading){
                  return LoadingWidget();
                } else
                if(state is Loaded){
                  return SchoolClassListview(data: state.schoolClassSwagger);
                }  else
                if(state is Error){
                  return MessageDisplay(message: "Có lỗi xãy ra, vui lòng thử lại!");
                }
              })
        ],
      ),
    );
  }

  void getClass(){
    BlocProvider.of<SchoolClassBloc>(context).add(GetSchoolClassEvent());
  }
}
