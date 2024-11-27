import 'package:connect_guide/domain/entities/auth/user.dart';

abstract class ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoLoaded extends ProfileInfoState {
  final UserEntity userEntity;

  ProfileInfoLoaded({required this.userEntity});
}

class ProfileInfoError extends ProfileInfoState {
  
}
