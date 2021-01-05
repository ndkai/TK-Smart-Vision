part of 'contact_book_bloc.dart';

@immutable
abstract class ContactBookEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetContactBookEvent extends ContactBookEvent{
  final int id;

  GetContactBookEvent({this.id});
  @override
  // TODO: implement props
  List<Object> get props => [id];
}
