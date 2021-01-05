part of 'tattendance_his_bloc.dart';

@immutable
abstract class TAttendanceHisState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class Empty extends TAttendanceHisState {}

class Loading extends TAttendanceHisState {}

class Loaded extends TAttendanceHisState {
  final List<TAttendanceHistory> attendanceHistories;
  Loaded({@required this.attendanceHistories});

  @override
  List<Object> get props => [attendanceHistories];
}

class Error extends TAttendanceHisState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}

class FilterAHState extends TAttendanceHisState {
  final List<TAttendanceHistory> attendanceHistories;

  FilterAHState({@required this.attendanceHistories});

  @override
  List<Object> get props => [attendanceHistories];
}