import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mainpage_event.dart';
part 'mainpage_state.dart';

class MainpageBloc extends Bloc<MainpageEvent, MainpageState> {
  MainpageBloc() : super(MainpageState(screenSelect: 0)) {
    on<MainpageEventScreenSelect>(onScreenSelect);
  }

  Future<void> onScreenSelect(
    MainpageEventScreenSelect event,
    Emitter<MainpageState> emit,
  ) async {
    emit(state.copyWith(screenSelect: event.screenNo));
  }
}
