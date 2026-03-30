part of 'burnmanage_bloc.dart';

class BurnmanageState extends Equatable {
  final bool isBaseMapGG;
  const BurnmanageState({required this.isBaseMapGG});

  BurnmanageState copyWith({bool? isBaseMapGG}) {
    return BurnmanageState(isBaseMapGG: isBaseMapGG ?? this.isBaseMapGG);
  }

  @override
  List<Object> get props => [isBaseMapGG];
}
