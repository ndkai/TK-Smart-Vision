part of 'study_point_bloc.dart';

@immutable
abstract class StudyPointState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class Empty extends StudyPointState {}

class Loading extends StudyPointState {}

class Loaded extends StudyPointState {
  final StudyPointSwagger point;
  Loaded({@required this.point});

  @override
  List<Object> get props => [point];
}

class Error extends StudyPointState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
