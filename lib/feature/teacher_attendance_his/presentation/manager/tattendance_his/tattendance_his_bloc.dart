import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/core/utils/input_converter.dart';
import 'package:fai_kul/feature/teacher_attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/teacher_attendance_his/domain/use_cases/get_attendance_history_by_page.dart';
import 'package:fai_kul/feature/teacher_attendance_his/domain/use_cases/get_attendence_history.dart';
import 'package:meta/meta.dart';
part 'tattendance_his_event.dart';

part 'tattendance_his_state.dart';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class TAttendanceHisBloc extends Bloc<TAttendanceHisEvent, TAttendanceHisState> {
  final InputConverter inputConverter;
  final GetTAttendanceHistory getAttendanceHistory;
  final GetTAttendanceHistoryByPage getAttendanceHistoryByPage;

  TAttendanceHisBloc({
  @required this.inputConverter,
  @required GetTAttendanceHistory ah,
  @required GetTAttendanceHistoryByPage ahbp,
  }) :  assert(ah != null),
        assert(ahbp != null),
        assert(inputConverter != null),
        getAttendanceHistory = ah,
        getAttendanceHistoryByPage = ahbp;
  @override
  TAttendanceHisState get initialState => Empty();

  @override
  Stream<TAttendanceHisState> mapEventToState(TAttendanceHisEvent event) async* {
    if(event is GetListAHByPage){
       final inputEither = inputConverter.stringToUnsignedInteger(event.pageNumber);
       yield* inputEither.fold(
           (failure) async* {
             yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
           },
           (integer) async* {
             yield Loading();
             final result = await getAttendanceHistoryByPage(Params(pageNumber: integer));
             yield* _eitherLoadedOrErrorState(result);
           });
    } else

    if(event is GetListAH){
      yield Loading();
      final failureOrSuccess = await getAttendanceHistory(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
    } else

    if(event is FilterAHEvent){
      yield Loading();
      yield* _processListHisX(event.startDay, event.endDay, event.list);
    }
  }

  Stream<TAttendanceHisState> _eitherLoadedOrErrorState(
      Either<Failure, TAttendanceHistorySwagger> failureOrsuccess,
      ) async* {

    yield failureOrsuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (success) => Loaded(attendanceHistories: success.data),
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

  Stream<TAttendanceHisState> _processListHisX(DateTime st, DateTime ed, List<TAttendanceHistory> list) async*{
    List<TAttendanceHistory> l = new List<TAttendanceHistory>();
    try{

      for(TAttendanceHistory items in list){
        if(DateTime.parse(items.date).compareTo(st) >= 0
            && DateTime.parse(items.date).compareTo(ed) <= 0){
          l.add(items);
          print("123111");
        }
      }
     print('xxxxxxx:${l.length}');
      if(l.length <= 0) {
        yield Error(message: "");
      } else
      yield  FilterAHState(attendanceHistories: l);
    } catch(e){
      print("_processListHisX: ${e.toString()}");
      yield Error(message: "Empty");
    }


  }
}
