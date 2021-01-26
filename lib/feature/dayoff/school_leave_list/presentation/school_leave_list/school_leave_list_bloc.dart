import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/attendance_his/presentation/manager/attendance_his/attendance_his_bloc.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/domain/entities/school_leave_list_swagger.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/domain/use_cases/get_school_leave_list.dart';
import 'package:meta/meta.dart';

part 'school_leave_list_event.dart';

part 'school_leave_list_state.dart';

class SchoolLeaveListBloc
    extends Bloc<SchoolLeaveListEvent, SchoolLeaveListState> {
  final GetSchoolLeaveList getSchoolLeaveList;

  SchoolLeaveListBloc({this.getSchoolLeaveList});
  @override
  SchoolLeaveListState get initialState => Empty();

  @override
  Stream<SchoolLeaveListState> mapEventToState(
      SchoolLeaveListEvent event) async* {
     if(event is GetListSchoolLeaveEvent){
       yield Loading();
       final result = await getSchoolLeaveList(NoParams());
       yield * _eitherLoadedOrErrorState(result);
     }
  }

  Stream<SchoolLeaveListState> _eitherLoadedOrErrorState(
      Either<Failure, SchoolLeaveListSwagger> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (res) => Loaded(schoolLeaveListSwagger: res),
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
