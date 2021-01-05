import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/login/presentation/widgets/message_display.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/domain/use_cases/get_contactbook.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/presentation/manager/contact_book/contact_book_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contactbook_listview.dart';

class ContactbookBody extends StatefulWidget {
  final int id;

  const ContactbookBody({Key key, this.id}) : super(key: key);
  @override
  _ContactbookBodyState createState() => _ContactbookBodyState();
}

class _ContactbookBodyState extends State<ContactbookBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BlocBuilder<ContactBookBloc, ContactBookState>(
              builder: (context, state){
                if(state is Empty){
                  getContactBook();
                  return MessageDisplay(message: "Thông tin trống");
                } else
                if(state is Loading){
                  return LoadingWidget();
                } else
                if(state is Loaded){
                  return ContactbookListview(data: state.contactBookSwagger,);
                }  else
                if(state is Error){
                  return MessageDisplay(message: "Có lỗi xãy ra, vui lòng thử lại!");
                }
              })
        ],
      ),
    );
  }
  void getContactBook(){
    BlocProvider.of<ContactBookBloc>(context).add(GetContactBookEvent(id: 1));
  }

}
