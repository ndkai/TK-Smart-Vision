part of 'class_student_bloc.dart';

@immutable
abstract class ClassStudentState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends ClassStudentState {}

class Loading extends ClassStudentState {}

class Loaded extends ClassStudentState {
  final ClassStudentSwagger studentSwagger;
  Loaded({@required this.studentSwagger});

  @override
  List<Object> get props => [studentSwagger];
}

class Error extends ClassStudentState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
