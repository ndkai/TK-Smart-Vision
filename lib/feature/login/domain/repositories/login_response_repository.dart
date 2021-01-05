
import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/feature/login/domain/entities/login_response.dart';

abstract class LoginResponseRepository{
  Future<Either<Failure, LoginSwagger>>  login(String email, String pass);

  Future<Either<Failure, LoginSwagger>>  getCurrentUser();
}