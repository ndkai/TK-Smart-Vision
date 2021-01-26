part of 'school_leave_list_bloc.dart';

@immutable
abstract class SchoolLeaveListState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends SchoolLeaveListState{}
class Loading  extends SchoolLeaveListState{}
class Loaded extends SchoolLeaveListState{
  final SchoolLeaveListSwagger schoolLeaveListSwagger;
  Loaded({this.schoolLeaveListSwagger});

  @override
  // TODO: implement props
  List<Object> get props => [schoolLeaveListSwagger];
}
class Error extends SchoolLeaveListState{
  final String message;
  Error({this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}