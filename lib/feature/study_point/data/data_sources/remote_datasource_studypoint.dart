import 'dart:convert';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/study_point/domain/entities/studypoin_swagger.dart';
import 'package:fai_kul/main.dart';
import 'package:http/http.dart' as http;
abstract class RemoteDatasourceStudyPoint{
  Future<StudyPointSwagger> getStudyPointRemote();
}

class RemoteDatasourceStudyPointImpl implements RemoteDatasourceStudyPoint{
  final http.Client client;

  RemoteDatasourceStudyPointImpl({this.client});

  @override
  Future<StudyPointSwagger> getStudyPointRemote() {
    // TODO: implement getStudyPointRemote
   return getStudyPointInURL();
  }

  Future<StudyPointSwagger> getStudyPointInURL() async {
    print("getStudyPointInURL");
  final response = await client
      .get('$mainUrl/v1/Employee?ClassId=2',
  headers: {
  "Accept": "application/json",
  "content-type": "application/json",
  'Authorization': 'Bearer ${appUser.data.token }', // k co header la failed 415
  });
  print("getStudyPointInURL ${response.statusCode}");
  if(response.statusCode == 200){
    try{
      var studyPoint  = StudyPointSwagger.fromJson(json.decode(response.body));
      return studyPoint;
    } catch(ex){
      throw ServerException();
    }

  }
  else{
    throw ServerException();
  }
 }
}