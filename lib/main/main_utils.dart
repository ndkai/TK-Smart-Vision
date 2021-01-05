import 'dart:convert';

import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/feature/login/domain/entities/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'nar_drawer/home_page.dart';

LoginSwagger getCurrentUser()  {
  final loginResponce = prefs.getString(SAVE_LOGIN_RESPONSE);
  if (loginResponce != null && loginResponce != '') {
    var responce = LoginSwagger.fromJson(json.decode(loginResponce));
    print('getCurrentUser${responce.data.username}');
    return responce;
  } else {
    throw CacheException();
  }
}