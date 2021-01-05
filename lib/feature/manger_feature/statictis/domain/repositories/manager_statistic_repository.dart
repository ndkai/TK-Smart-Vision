import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/manger_feature/statictis/domain/entities/StatisticResponse.dart';

abstract class ManagerStatisticRepository{
  Future<Either<Failure, StatisticResponseSwaggger>> getOverviewStatistic();
}