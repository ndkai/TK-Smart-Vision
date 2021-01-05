import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/network/network_info.dart';
import 'package:fai_kul/feature/point_input/api/class_student/data/data_sources/remote_class_student_datasource.dart';
import 'package:fai_kul/feature/point_input/api/class_student/domain/entities/class_student.dart';
import 'package:fai_kul/feature/point_input/api/class_student/domain/repositories/classdtudent_repo.dart';

class ClassStudentRepoImpl implements ClassStudentRepo{
  final NetworkInfo networkInfo;
  final RemoteClassStudentDatasource datasource;

  ClassStudentRepoImpl({this.networkInfo, this.datasource});
  @override
  Future<Either<Failure, ClassStudentSwagger>> getStudentClass(int id) {
    // TODO: implement getStudentClass
    return _getStudyPointSwagger(datasource.getStudentSwagger(id));
  }

  Future<Either<Failure, ClassStudentSwagger>> _getStudyPointSwagger(
      Future<ClassStudentSwagger> getData) async {
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