import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/domain/entities/ContactBookSwagger.dart';

abstract class ContactBookRepo{
  Future<Either<Failure,ContactBookSwagger>> getContactBookRepo(int id);
}