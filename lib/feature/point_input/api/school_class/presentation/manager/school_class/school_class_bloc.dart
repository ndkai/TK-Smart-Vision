import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/attendance_his/presentation/manager/attendance_his/attendance_his_bloc.dart';
import 'package:fai_kul/feature/point_input/api/school_class/domain/entities/school_class_swagger.dart';
import 'package:fai_kul/feature/point_input/api/school_class/domain/use_cases/get_school_class.dart';
import 'package:fai_kul/feature/top_recorder/presentation/manager/top_recoder/top_recoder_bloc.dart';
import 'package:meta/meta.dart';

part 'school_class_event.dart';

part 'school_class_state.dart';

class SchoolClassBloc extends Bloc<SchoolClassEvent, SchoolClassState> {
  final GetSchoolClass getSchoolClass;

  SchoolClassBloc({this.getSchoolClass});
  @override
  SchoolClassState get initialState => Empty();

  @override
  Stream<SchoolClassState> mapEventToState(SchoolClassEvent event) async* {
    if(event is GetSchoolClassEvent){
      yield Loading();
      final result = await getSchoolClass(NoParams());
      yield* _eitherLoadedOrErrorState(result);
    }
  }

  Stream<SchoolClassState> _eitherLoadedOrErrorState(
      Either<Failure, SchoolClassSwagger> failureOrsuccess,
      ) async* {
    print("chay khogn ta");
    yield failureOrsuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (success) => Loaded(schoolClassSwagger: success),
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
