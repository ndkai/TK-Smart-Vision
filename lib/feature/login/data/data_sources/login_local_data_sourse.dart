
import 'dart:convert';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalLoginDataSource{
  Future<LoginSwagger> getLoginUser();
  
  Future<void> saveLoginResponse(LoginSwagger loginResponseModel);
}

const SAVE_LOGIN_RESPONSE = 'SAVE_LOGIN_RESPONSE';

class LocalLoginDataSourceImpl implements LocalLoginDataSource{
  final SharedPreferences sharedPreferences;

  LocalLoginDataSourceImpl({this.sharedPreferences});

  @override
  Future<LoginSwagger> getLoginUser() {
    final jsonString = sharedPreferences.getString(SAVE_LOGIN_RESPONSE);
    if(jsonString != null && jsonString!=''){
      return Future.value(LoginSwagger.fromJson(json.decode(jsonString)));
    } else{
      throw CacheException();
    }
  }

  @override
  Future<void> saveLoginResponse(LoginSwagger loginResponseModel) {
    print("saveLoginResponse${ json.encode(loginResponseModel.toJson())}");
    return sharedPreferences.setString(
        SAVE_LOGIN_RESPONSE,
        json.encode(loginResponseModel.toJson()));
  }

  
}

