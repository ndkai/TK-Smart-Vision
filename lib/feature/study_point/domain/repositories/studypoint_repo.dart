import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/study_point/domain/entities/studypoin_swagger.dart';

abstract class StudypointRepo{
  Future<Either<Failure, StudyPointSwagger>> getStudyPointRepo();
}