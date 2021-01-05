import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/attendance_his/presentation/manager/attendance_his/attendance_his_bloc.dart';
import 'package:fai_kul/feature/manger_feature/statictis/domain/entities/StatisticResponse.dart';
import 'package:fai_kul/feature/manger_feature/statictis/domain/repositories/manager_statistic_repository.dart';
import 'package:fai_kul/feature/manger_feature/statictis/domain/use_cases/get_overrall_statistic.dart';
import 'package:meta/meta.dart';

part 'statistic_event.dart';

part 'statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  final GetOverRallStatistic getOverRallStatistic;

  StatisticBloc({@required GetOverRallStatistic getOverall}) : assert(getOverall != null), getOverRallStatistic = getOverall;
  @override
  StatisticState get initialState => Empty();

  @override
  Stream<StatisticState> mapEventToState(StatisticEvent event) async* {
    if(event is GetStatistic){
      yield Loading();
      final result = await getOverRallStatistic(NoParams());
      yield* _eitherLoadedOrErrorState(result);
    }
  }


  Stream<StatisticState> _eitherLoadedOrErrorState(
      Either<Failure, StatisticResponseSwaggger> failureOrsuccess,
      ) async* {

    yield failureOrsuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (success) => Loaded(statisticResponseSwaggger: success),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
