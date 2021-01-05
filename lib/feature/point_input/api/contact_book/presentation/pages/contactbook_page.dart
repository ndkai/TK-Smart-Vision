import 'package:fai_kul/feature/point_input/api/class_student/presentation/pages/class_student_page.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/presentation/manager/contact_book/contact_book_bloc.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/presentation/widgets/add_contactbook_dialog.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/presentation/widgets/contactbook_body.dart';
import 'package:fai_kul/feature/point_input/api/school_class/presentation/manager/school_class/school_class_bloc.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../injection_container.dart';

int currentContactBookId = 0;
class ContactbookPage extends StatefulWidget {
  final int id;

  const ContactbookPage({Key key, this.id}) : super(key: key);
  @override
  _ContactbookPageState createState() => _ContactbookPageState();
}

class _ContactbookPageState extends State<ContactbookPage> {
  @override
  Widget build(BuildContext context) {
    currentContactBookId = widget.id;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sổ liên lạc'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClassStudentPage(id: currentClassStudentId,)),
            );
          },
        ),
      ),
      floatingActionButton:    FloatingActionButton(
        backgroundColor:Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          showAddCbookDialog(context);
        },
        heroTag: null,
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<ContactBookBloc> buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<ContactBookBloc>(),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: ContactbookBody(id: widget.id),
                ), // Bottom half
              ],
            ),
          )
        ],
      ),
    );
  }
}

