import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/network/network_info.dart';
import 'package:fai_kul/feature/manger_feature/statictis/data/data_sources/remote_statistic_datasourse.dart';
import 'package:fai_kul/feature/manger_feature/statictis/domain/entities/StatisticResponse.dart';
import 'package:fai_kul/feature/manger_feature/statictis/domain/repositories/manager_statistic_repository.dart';

class ManagerStatisticRepoImpl implements ManagerStatisticRepository{
  final NetworkInfo networkInfo;
  final RemoteStatisticDatasource remoteDataSource;

  ManagerStatisticRepoImpl({this.networkInfo, this.remoteDataSource});
  @override
  Future<Either<Failure, StatisticResponseSwaggger>> getOverviewStatistic() {
    // TODO: implement getOverviewStatistic
   return getStatistic(remoteDataSource.getStatistic());
  }


  Future<Either<Failure, StatisticResponseSwaggger>> getStatistic
      (Future<StatisticResponseSwaggger> getStatistic) async {
      if(await networkInfo.isConnected){
        print("ManagerStatisticRepoImpl");
        try{
          final result = await getStatistic;
          print("lolllllll");
          return Right(result);
        } on ServerException {
          return Left(ServerFailure());
        }
      } else return Left(ServerFailure());

      }
  }