import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/attendance_his/presentation/manager/attendance_his/attendance_his_bloc.dart';
import 'package:fai_kul/feature/point_input/api/class_student/domain/use_cases/get_studentclass.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/domain/entities/ContactBookSwagger.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/domain/use_cases/get_contactbook.dart';
import 'package:meta/meta.dart';

part 'contact_book_event.dart';

part 'contact_book_state.dart';

class ContactBookBloc extends Bloc<ContactBookEvent, ContactBookState> {
  final GetContactBook getContactBook;

  ContactBookBloc({this.getContactBook});
  @override
  ContactBookState get initialState => Empty();

  @override
  Stream<ContactBookState> mapEventToState(ContactBookEvent event) async* {
   if(event is GetContactBookEvent){
     yield Loading();
     final result = await getContactBook(IDParams(event.id));
     yield*  _eitherLoadedOrErrorState(result);
   }
  }
  Stream<ContactBookState> _eitherLoadedOrErrorState(
      Either<Failure, ContactBookSwagger> failureOrsuccess,
      ) async* {
    print("chay khogn ta");
    yield failureOrsuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (success) => Loaded(contactBookSwagger: success),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}

