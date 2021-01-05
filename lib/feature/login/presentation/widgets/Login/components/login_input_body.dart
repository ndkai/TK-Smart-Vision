import 'package:fai_kul/feature/choosing_role/choosing_role.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/pages/manager_statictic_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:fai_kul/feature/login/presentation/components/already_have_an_account_acheck.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_button.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_input_field.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_password_field.dart';
import 'package:fai_kul/feature/login/presentation/manager/login/login_bloc.dart';
import 'package:fai_kul/feature/login/presentation/widgets/Login/components/background.dart';
import 'package:fai_kul/feature/login/presentation/widgets/Signup/signup_screen.dart';
import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../main.dart';

class LoginInputBody extends StatefulWidget {
  @override
  _LoginInputBodyState createState() => _LoginInputBodyState();
}

class _LoginInputBodyState extends State<LoginInputBody> {
  String email;
  String pass;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return   BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if(state is Empty){
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/images/titkul_logo.png",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  clear;
                  email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  clear;
                  pass = value;
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  login();
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      } else
      if (state is Loaded) {
        if(state.loginResponse.data.roleName == "PHUHUYNH" || state.loginResponse.data.roleName == "GIAOVIEN" ){
          appUser = state.loginResponse;
          print("dang nhap vao r ne ${state.loginResponse.data.email}");
          return HomePage(
            key: textGlobalKey,
          );
        } else{
          appUser = state.loginResponse;
          return ManagerStatisticPage();
        }
      }
      if (state is Loading) {
        return LoadingWidget();
      } else if (state is Error) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/images/titkul_logo.png",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  clear;
                  email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  clear;
                  pass = value;
                },
              ),
              Text('Something went wrong, try again!',
                  style: TextStyle(color: Colors.red)),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  login();
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }
    });
    // Bottom hal
  }

  void login() {
    print("asdasdasdads");
    BlocProvider.of<LoginBloc>(context).add(LoginE(email, pass));
  }

  void isLogin() {
    BlocProvider.of<LoginBloc>(context).add(IsLogin());
  }

  void clear() {
    BlocProvider.of<LoginBloc>(context).add(ClearE());
  }
}
