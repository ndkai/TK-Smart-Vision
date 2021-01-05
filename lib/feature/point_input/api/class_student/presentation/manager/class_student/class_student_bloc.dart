import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/attendance_his/presentation/manager/attendance_his/attendance_his_bloc.dart';
import 'package:fai_kul/feature/point_input/api/class_student/domain/entities/class_student.dart';
import 'package:fai_kul/feature/point_input/api/class_student/domain/use_cases/get_studentclass.dart';
import 'package:meta/meta.dart';

part 'class_student_event.dart';

part 'class_student_state.dart';

class ClassStudentBloc extends Bloc<ClassStudentEvent, ClassStudentState> {
  final GetClassStudent getClassStudent;

  ClassStudentBloc({this.getClassStudent});
  @override
  ClassStudentState get initialState => Empty();

  @override
  Stream<ClassStudentState> mapEventToState(ClassStudentEvent event) async* {
    if(event is GetClassStudentEvent){
      yield Loading();
      final failureOrSuccess = await getClassStudent(IDParams(event.id));
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
    }
  }


  Stream<ClassStudentState> _eitherLoadedOrErrorState(
      Either<Failure, ClassStudentSwagger> failureOrsuccess,
      ) async* {
    print("_eitherLoadedOrErrorState");
    yield failureOrsuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (success) => Loaded(studentSwagger: success),
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
