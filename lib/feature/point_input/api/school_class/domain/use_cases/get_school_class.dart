import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/point_input/api/school_class/domain/entities/school_class_swagger.dart';
import 'package:fai_kul/feature/point_input/api/school_class/domain/repositories/schoolclass_repo.dart';

class GetSchoolClass extends UseCase<SchoolClassSwagger, NoParams>{
  final SchoolClassRepo repo;

  GetSchoolClass(this.repo);
  @override
  Future<Either<Failure, SchoolClassSwagger>> call(NoParams params) async {
    // TODO: implement call
    return await repo.getSchoolClass();
  }

}