import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/FeeSwagger.dart';

abstract class FeeRepository{
  Future<Either<Failure, List<FeeSwagger>>> getStudentFee();
}