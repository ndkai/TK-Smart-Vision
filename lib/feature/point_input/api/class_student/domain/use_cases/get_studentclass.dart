import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/point_input/api/class_student/domain/entities/class_student.dart';
import 'package:fai_kul/feature/point_input/api/class_student/domain/repositories/classdtudent_repo.dart';

class GetClassStudent extends UseCase<ClassStudentSwagger, IDParams>{
  final ClassStudentRepo repo;

  GetClassStudent(this.repo);
  @override
  Future<Either<Failure, ClassStudentSwagger>> call(IDParams params) async {
    // TODO: implement call
    return await repo.getStudentClass(params.id);
  }

}


class IDParams extends Equatable {
 final int id;

  IDParams(this.id);

  @override
  // TODO: implement props
  List<Object> get props => [id];
}