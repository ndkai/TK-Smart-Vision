part of 'school_class_bloc.dart';

@immutable
abstract class SchoolClassState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class Empty extends SchoolClassState{}

class Loading extends SchoolClassState{}

class Loaded extends SchoolClassState{
  final SchoolClassSwagger schoolClassSwagger;

  Loaded({this.schoolClassSwagger});
  @override
  // TODO: implement props
  List<Object> get props => [schoolClassSwagger];
}

class Error extends SchoolClassState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
