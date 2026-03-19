part of 'mainpage_bloc.dart';

class MainpageState extends Equatable {
  final int screenSelect;

  const MainpageState({required this.screenSelect});

  MainpageState copyWith({int? screenSelect}) {
    return MainpageState(screenSelect: screenSelect ?? this.screenSelect);
  }

  @override
  List<Object> get props => [screenSelect];
}
