import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/point_input/api/school_class/domain/entities/school_class_swagger.dart';
abstract class SchoolClassRepo{
  Future<Either<Failure, SchoolClassSwagger>> getSchoolClass();
}