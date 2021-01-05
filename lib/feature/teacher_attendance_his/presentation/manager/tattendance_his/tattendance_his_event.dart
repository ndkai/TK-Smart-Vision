part of 'tattendance_his_bloc.dart';

@immutable
abstract class TAttendanceHisEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetListAH extends TAttendanceHisEvent{
}

class GetListAHByPage extends TAttendanceHisEvent{
    final String pageNumber;

    GetListAHByPage(this.pageNumber);

  @override
  // TODO: implement props
  List<Object> get props => [pageNumber];
}

class FilterAHEvent extends TAttendanceHisEvent{
  final DateTime startDay;
  final DateTime endDay;
  final List<TAttendanceHistory> list;

  FilterAHEvent(this.startDay, this.endDay, this.list);


  @override
  // TODO: implement props
  List<Object> get props => [startDay, endDay, list];
}

