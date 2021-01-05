import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/network/network_info.dart';
import 'package:fai_kul/feature/study_point/data/data_sources/remote_datasource_studypoint.dart';
import 'package:fai_kul/feature/study_point/domain/entities/studypoin_swagger.dart';
import 'package:fai_kul/feature/study_point/domain/repositories/studypoint_repo.dart';

class StudyPointRepoIpml implements StudypointRepo {
  final NetworkInfo networkInfo;
  final RemoteDatasourceStudyPoint datasourceStudyPoint;

  StudyPointRepoIpml({this.networkInfo, this.datasourceStudyPoint});


  @override
  Future<Either<Failure, StudyPointSwagger>> getStudyPointRepo() {
    // TODO: implement getStudyPointRepo
    return _getStudyPointSwagger(datasourceStudyPoint.getStudyPointRemote());
  }

  Future<Either<Failure, StudyPointSwagger>> _getStudyPointSwagger(
      Future<StudyPointSwagger> getData) async {
    if(await networkInfo.isConnected){
       try{
         var result = await getData;
         return Right(result);
       } on ServerException{
         return Left(ServerFailure());
       }
    } else{
      return Left(ServerFailure());
    }
  }


}
