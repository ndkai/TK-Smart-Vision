import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/manger_feature/statictis/domain/entities/StatisticResponse.dart';
import 'package:fai_kul/feature/manger_feature/statictis/domain/repositories/manager_statistic_repository.dart';

class GetOverRallStatistic extends UseCase<StatisticResponseSwaggger, NoParams>{

  final ManagerStatisticRepository repository;

  GetOverRallStatistic(this.repository);
  @override
  Future<Either<Failure, StatisticResponseSwaggger>> call(NoParams params) async {
    // TODO: implement call
    return await repository.getOverviewStatistic();
  }

}