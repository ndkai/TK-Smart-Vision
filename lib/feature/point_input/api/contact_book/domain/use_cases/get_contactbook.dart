import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/point_input/api/class_student/domain/use_cases/get_studentclass.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/domain/entities/ContactBookSwagger.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/domain/repositories/contactbook_repo.dart';

class GetContactBook extends UseCase<ContactBookSwagger, IDParams>{
  final ContactBookRepo contactBookRepo;

  GetContactBook(this.contactBookRepo);
  @override
  Future<Either<Failure, ContactBookSwagger>> call(IDParams params) async {
    // TODO: implement call
     return await contactBookRepo.getContactBookRepo(params.id);
  }

}
