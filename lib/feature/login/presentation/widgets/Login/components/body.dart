import 'dart:convert';

import 'package:fai_kul/feature/camera/face_detection_camera.dart';
import 'package:fai_kul/feature/choosing_role/choosing_role.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/feature/login/presentation/components/already_have_an_account_acheck.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_button.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_input_field.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_password_field.dart';
import 'package:fai_kul/feature/login/presentation/manager/login/login_bloc.dart';
import 'package:fai_kul/feature/login/presentation/widgets/Signup/signup_screen.dart';
import 'package:fai_kul/feature/login/presentation/widgets/Welcome/welcome_screen.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/pages/manager_statictic_page.dart';
import 'package:fai_kul/main/main_utils.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import '../../../../../../main.dart';
import '../../LoginDisplay.dart';
import '../../loading_widget.dart';
import '../../message_display.dart';
import 'background.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email;
  String pass;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is Empty) {
        isLogin();
      } else if (state is LoginAlready) {
        String string = prefs.getString(SAVE_LOGIN_RESPONSE);
        LoginSwagger lr = LoginSwagger.fromJson(json.decode(string));
        if(lr.data.roleName == "PHUHUYNH" || lr.data.roleName == "GIAOVIEN" ){
          appUser = lr;
          print("Nguoi dung hien tai la ${lr.data.roleName}");
          return HomePage(
            key: textGlobalKey,
          );
        } else{
          appUser = lr;
          return ManagerStatisticPage();
        }
      } else if (state is NotLogin) {
        return ChoosingRolePage();
      }
    }));
  }

  void login() {
    BlocProvider.of<LoginBloc>(context).add(LoginE(email, pass));
  }

  void isLogin() {
    BlocProvider.of<LoginBloc>(context).add(IsLogin());
  }

  void clear() {
    BlocProvider.of<LoginBloc>(context).add(ClearE());
  }

  void getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    log("locationx: ${_locationData.latitude}");
    log("locationx: ${_locationData.longitude}");
  }
}
