import 'package:fai_kul/feature/login/presentation/components/already_have_an_account_acheck.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_button.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_input_field.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_password_field.dart';
import 'package:fai_kul/feature/login/presentation/manager/login/login_bloc.dart';
import 'package:fai_kul/feature/login/presentation/widgets/Login/components/background.dart';
import 'package:fai_kul/feature/login/presentation/widgets/Login/components/login_input_body.dart';
import 'package:fai_kul/feature/login/presentation/widgets/Signup/signup_screen.dart';
import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../../main.dart';

class LoginInputPage extends StatefulWidget {
  static const String routeName = "LoginInputPage";
  @override
  _LoginInputPageState createState() => _LoginInputPageState();
}

class _LoginInputPageState extends State<LoginInputPage> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: buildBody(context),
        )
      ),
    );

  }

  BlocProvider<LoginBloc> buildBody(BuildContext context) {

    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: Stack(
        children: <Widget>[Padding(
          padding: const EdgeInsets.all(0),
          child: LoginInputBody()
            
    )]));
  }


}
