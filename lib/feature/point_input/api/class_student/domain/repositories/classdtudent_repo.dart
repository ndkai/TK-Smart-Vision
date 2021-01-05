import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/point_input/api/class_student/domain/entities/class_student.dart';
abstract class ClassStudentRepo{
  Future<Either<Failure, ClassStudentSwagger>> getStudentClass(int id);
}