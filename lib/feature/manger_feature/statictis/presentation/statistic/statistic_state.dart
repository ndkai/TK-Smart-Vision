part of 'statistic_bloc.dart';

@immutable
abstract class StatisticState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends StatisticState {}

class Loading extends StatisticState {}

class Loaded extends StatisticState {
  final StatisticResponseSwaggger statisticResponseSwaggger;
  Loaded({@required this.statisticResponseSwaggger});

  @override
  List<Object> get props => [statisticResponseSwaggger];
}

class Error extends StatisticState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
