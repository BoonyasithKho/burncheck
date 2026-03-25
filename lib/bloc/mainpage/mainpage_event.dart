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

class MainpageEventGetPM25 extends MainpageEvent {
  final List<double> userPosition;
  const MainpageEventGetPM25({required this.userPosition});
}

class MainpageEventGetWeather extends MainpageEvent {
  final List<double> userPosition;
  const MainpageEventGetWeather({required this.userPosition});
}

class MainpageEventGetUserLocation extends MainpageEvent {
  const MainpageEventGetUserLocation();
}
