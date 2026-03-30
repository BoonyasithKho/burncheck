part of 'burnmanage_bloc.dart';

abstract class BurnmanageEvent extends Equatable {
  const BurnmanageEvent();

  @override
  List<Object> get props => [];
}

class BurnmanageEventSwitchBasemap extends BurnmanageEvent {}
