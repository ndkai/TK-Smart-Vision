import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/network/network_info.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/data/data_sources/remote_contactbook_datasource.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/domain/entities/ContactBookSwagger.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/domain/repositories/contactbook_repo.dart';

class ContactBookRepoImpl implements ContactBookRepo{
  final NetworkInfo networkInfo;
  final RemoteContactbookDataSource remoteContactbookDataSource;

  ContactBookRepoImpl({this.networkInfo, this.remoteContactbookDataSource});
  @override
  Future<Either<Failure, ContactBookSwagger>> getContactBookRepo(int id) {
    // TODO: implement getContactBookRepo
    return getData(remoteContactbookDataSource.getRemoteContactbook(id));
  }

  Future<Either<Failure, ContactBookSwagger>> getData
      (Future<ContactBookSwagger> getBookContact) async {
    print("có hchajy ở day k");
    if(await networkInfo.isConnected){
      try{
        final result = await getBookContact;
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else return Left(ServerFailure());
  }

}