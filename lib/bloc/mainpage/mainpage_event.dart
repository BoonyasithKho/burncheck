part of 'mainpage_bloc.dart';

abstract class MainpageEvent extends Equatable {
  const MainpageEvent();

  @override
  List<Object> get props => [];
}

class MainpageEventScreenSelect extends MainpageEvent {
  final int screenNo;
  const MainpageEventScreenSelect({required this.screenNo});
}
