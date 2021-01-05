part of 'contact_book_bloc.dart';

@immutable
abstract class ContactBookState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class Empty extends ContactBookState{}

class Loading extends ContactBookState{}

class Loaded extends ContactBookState{
  final ContactBookSwagger contactBookSwagger;

  Loaded({this.contactBookSwagger});
  @override
  // TODO: implement props
  List<Object> get props => [contactBookSwagger];
}

class Error extends ContactBookState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
