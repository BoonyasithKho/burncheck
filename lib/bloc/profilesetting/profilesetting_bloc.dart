import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profilesetting_event.dart';
part 'profilesetting_state.dart';

class ProfilesettingBloc
    extends Bloc<ProfilesettingEvent, ProfilesettingState> {
  ProfilesettingBloc() : super(ProfilesettingState(isLogin: false)) {
    on<ProfilesettingEventLogin>(onLogin);
  }

  Future<void> onLogin(
    ProfilesettingEventLogin event,
    Emitter<ProfilesettingState> emit,
  ) async {
    emit(state.copyWith(isLogin: event.isLogin));
  }
}
