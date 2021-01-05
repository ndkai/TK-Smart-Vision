import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/network/network_info.dart';
import 'package:fai_kul/feature/point_input/api/school_class/data/data_sources/remote_schoolclass_datasource.dart';
import 'package:fai_kul/feature/point_input/api/school_class/domain/entities/school_class_swagger.dart';
import 'package:fai_kul/feature/point_input/api/school_class/domain/repositories/schoolclass_repo.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SchoolClassRepoImpl implements SchoolClassRepo{
  final NetworkInfo networkInfo;
  final RemoteSchoolClassDataSource dataSource;

  SchoolClassRepoImpl({this.networkInfo, this.dataSource});
  @override
  Future<Either<Failure, SchoolClassSwagger>> getSchoolClass() {
    // TODO: implement getSchoolClass
    return getData(dataSource.getSchoolClassData());
  }

  Future<Either<Failure, SchoolClassSwagger>> getData
      (Future<SchoolClassSwagger> getClass) async {
    print("có hchajy ở day k");
    if(await networkInfo.isConnected){
      try{
        final histories = await getClass;

        return Right(histories);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else return Left(ServerFailure());
  }
}