part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class UserDownloadedState extends ProfileState {
  UserModel? userModel;
  UserDownloadedState({
    this.userModel,
  });
}

class FailedState extends ProfileState {}

class GettingDataLoadingState extends ProfileState {}
