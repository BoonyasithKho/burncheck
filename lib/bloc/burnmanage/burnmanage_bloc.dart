import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'burnmanage_event.dart';
part 'burnmanage_state.dart';

class BurnmanageBloc extends Bloc<BurnmanageEvent, BurnmanageState> {
  BurnmanageBloc() : super(BurnmanageState(isBaseMapGG: true)) {
    on<BurnmanageEventSwitchBasemap>(onSwitchBasemap);
  }

  Future<void> onSwitchBasemap(
    BurnmanageEventSwitchBasemap event,
    Emitter<BurnmanageState> emit,
  ) async {
    emit(state.copyWith(isBaseMapGG: !state.isBaseMapGG));
  }
}
