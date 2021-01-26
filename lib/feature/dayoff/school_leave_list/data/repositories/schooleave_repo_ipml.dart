import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/network/network_info.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/data/data_sources/remote_school_leave_leave_dts.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/domain/entities/school_leave_list_swagger.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/domain/repositories/school_leave_list_repo.dart';

class SchoolLeaveRepoListImpl extends SchoolLeaveListRepo{
  final SchoolLeaveListDataSource dataSource;
  final NetworkInfo networkInfo;

  SchoolLeaveRepoListImpl({this.dataSource, this.networkInfo});
  @override
  Future<Either<Failure, SchoolLeaveListSwagger>> getSchoolLeaveList() {
    // TODO: implement getSchoolLeaveList
   return getIt(dataSource.getData());
  }

  Future<Either<Failure, SchoolLeaveListSwagger>> getIt
      (Future<SchoolLeaveListSwagger> getListSchoolLeave) async {

    if(await networkInfo.isConnected){
      try{
        final response = await getListSchoolLeave;
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else return Left(ServerFailure());
  }


}