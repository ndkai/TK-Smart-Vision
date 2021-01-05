import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/network/network_info.dart';
import 'package:fai_kul/feature/teacher_attendance_his/data/data_sources/local_attendance_history_datasource.dart';
import 'package:fai_kul/feature/teacher_attendance_his/data/data_sources/remote_attendance_history_datasource.dart';
import 'package:fai_kul/feature/teacher_attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/teacher_attendance_his/domain/repositories/history_attendance_repository.dart';


class TAttendanceHistoryRepositoryImpl extends TAttendanceHistoryRepository{
  final NetworkInfo networkInfo;
  final RemoteTAttendanceHistoryDataSource remoteDataSource;
  final LocalTAttendanceHistoryDataSource localDataSource;

  TAttendanceHistoryRepositoryImpl({this.networkInfo, this.remoteDataSource, this.localDataSource});
  @override
  Future<Either<Failure, TAttendanceHistorySwagger>> geAttendanceHistory() {
    log("geAttendanceHistory");
    return _getHistory(remoteDataSource.getAttendanceHistories());
  }

  @override
  Future<Either<Failure, TAttendanceHistorySwagger>> geAttendanceHistoryByPage(int pageNumber) {
    log("geAttendanceHistoryByPage");
    return _getHistory(remoteDataSource.getAttendanceHistoriesByPages(pageNumber));
  }

  @override
  Future<Either<Failure, TAttendanceHistorySwagger>> getLocalAttendanceHis() {
    return _getLocalHis();
  }

  Future<Either<Failure, TAttendanceHistorySwagger>> _getHistory
      (Future<TAttendanceHistorySwagger> getHistory) async {
    if(await networkInfo.isConnected){
      try{
        final histories = await getHistory;
        localDataSource.saveAttendanceHistory(histories);
        log("_getHistory ${histories.data.length}");
        return Right(histories);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else return Left(ServerFailure());
  }

  Future<Either<Failure, TAttendanceHistorySwagger>> _getLocalHis() async{
    if(await networkInfo.isConnected){
      try{
      final data = await localDataSource.getLocalAttendanceHistory();
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else return Left(ServerFailure());
  }

}