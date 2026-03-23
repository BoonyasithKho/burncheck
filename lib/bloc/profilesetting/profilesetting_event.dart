part of 'profilesetting_bloc.dart';

abstract class ProfilesettingEvent extends Equatable {
  const ProfilesettingEvent();

  @override
  List<Object> get props => [];
}

class ProfilesettingEventLogin extends ProfilesettingEvent {
  final bool isLogin;
  const ProfilesettingEventLogin({required this.isLogin});
}
