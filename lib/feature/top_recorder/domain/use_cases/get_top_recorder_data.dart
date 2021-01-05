import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/schedule/api/schedule_model.dart';
import 'package:fai_kul/feature/top_recorder/domain/entities/toprecorder_swagger.dart';
import 'package:fai_kul/feature/top_recorder/domain/repositories/toprecorder_repository.dart';

class GetTopRecorderUsecase implements UseCase<ScheduleSwagger, NoParams>{
  final TopRecorderRepo topRecorderRepo;

  GetTopRecorderUsecase(this.topRecorderRepo);
  @override
  Future<Either<Failure, ScheduleSwagger>> call(NoParams params) async {
    return await topRecorderRepo.getTopRecorder();
  }

}