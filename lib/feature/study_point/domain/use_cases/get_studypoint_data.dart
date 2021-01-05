import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/study_point/domain/entities/studypoin_swagger.dart';
import 'package:fai_kul/feature/study_point/domain/repositories/studypoint_repo.dart';

class GetStudyPointData extends UseCase<StudyPointSwagger, NoParams>{
  final StudypointRepo studypointRepo;

  GetStudyPointData(this.studypointRepo);
  @override
  Future<Either<Failure, StudyPointSwagger>> call(NoParams params) async {
    // TODO: implement call
    return  await studypointRepo.getStudyPointRepo();
  }

}