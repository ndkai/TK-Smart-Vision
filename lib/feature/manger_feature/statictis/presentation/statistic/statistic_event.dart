part of 'statistic_bloc.dart';

@immutable
abstract class StatisticEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetStatistic extends StatisticEvent{
  
}