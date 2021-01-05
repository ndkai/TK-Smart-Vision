import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/attendance_his/presentation/manager/attendance_his/attendance_his_bloc.dart';
import 'package:fai_kul/feature/study_point/domain/entities/studypoin_swagger.dart';
import 'package:fai_kul/feature/study_point/domain/use_cases/get_studypoint_data.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/FeeSwagger.dart';
import 'package:meta/meta.dart';

part 'study_point_event.dart';

part 'study_point_state.dart';

class StudyPointBloc extends Bloc<StudyPointEvent, StudyPointState> {
  final GetStudyPointData getStudyPointData;

  StudyPointBloc({this.getStudyPointData});
  @override
  StudyPointState get initialState => Empty();

  @override
  Stream<StudyPointState> mapEventToState(StudyPointEvent event) async* {
    if(event is GetStudyPoint){
      yield Loading();
      final failureOrSuccess = await getStudyPointData(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
    }
  }

  Stream<StudyPointState> _eitherLoadedOrErrorState(
      Either<Failure, StudyPointSwagger> failureOrsuccess,
      ) async* {
    print("_eitherLoadedOrErrorState");
    yield failureOrsuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (success) => Loaded(point: success),
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
