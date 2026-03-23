part of 'profilesetting_bloc.dart';

class ProfilesettingState extends Equatable {
  final bool isLogin;

  const ProfilesettingState({required this.isLogin});

  ProfilesettingState copyWith({bool? isLogin}) {
    return ProfilesettingState(isLogin: isLogin ?? this.isLogin);
  }

  @override
  List<Object> get props => [isLogin];
}
