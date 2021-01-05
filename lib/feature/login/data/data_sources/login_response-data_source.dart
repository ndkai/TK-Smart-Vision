import 'dart:convert';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/data/data_sources/remote_attendance_history_datasource.dart';
import 'package:fai_kul/feature/choosing_role/choosing_role.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/main.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'dart:developer';

const String PRINCIPAL_LOGIN = "PRINCIPAL_LOGIN";
abstract class LoginResponseDataSource {
  Future<LoginSwagger> login(String email, String pass);
}

class LoginResponseImpl implements LoginResponseDataSource {
  final http.Client client;

  LoginResponseImpl({@required this.client});


  @override
  Future<LoginSwagger> login(String email, String pass) =>
      _loginFromUrl(email, pass);

  Future<LoginSwagger> _loginFromUrl(String email, String pass) async {
    var body = jsonEncode( {
      'username': email,
      'password': pass
    });
    print('$mainUrl${LoginURL}');
    final response = await client.post(
        '$mainUrl/v1/User/Login',
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"       // k co header la failed 415
        },
        body: body).timeout(Duration(seconds: 15));
    print("lol mâm ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      log("xxx1: ${json.decode(response.body)}");
      prefs.setString(SAVE_LOGIN_RESPONSE, response.body);
      var swagger;
           swagger = LoginSwagger.fromJson(json.decode((response.body)));
      return swagger;
    }
      else {
      throw ServerException();
    }
  }

}
