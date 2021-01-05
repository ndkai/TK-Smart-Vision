import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/feature/login/domain/entities/login_response.dart';
import 'package:fai_kul/feature/login/domain/repositories/login_response_repository.dart';

class GetCurrentUser implements UseCase<LoginSwagger, NoParams>{
  final LoginResponseRepository repository;

  GetCurrentUser(this.repository);

  
  @override
  Future<Either<Failure, LoginSwagger>> call(NoParams params) async {
    // TODO: implement call
    return await repository.getCurrentUser();
  }

}