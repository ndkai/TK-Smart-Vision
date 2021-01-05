part of 'class_student_bloc.dart';

@immutable
abstract class ClassStudentEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetClassStudentEvent extends ClassStudentEvent{
  final int id;

  GetClassStudentEvent({this.id});
  @override
  // TODO: implement props
  List<Object> get props => [id];
}
