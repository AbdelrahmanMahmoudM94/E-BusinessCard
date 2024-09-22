part of 'edit_profile_cubit.dart';

abstract class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileSuccessState extends EditProfileState {
  EditProfileSuccessState();
}

class EditProfileErrorState extends EditProfileState {
  EditProfileErrorState({this.message});

  final String? message;
}

class EditProfileLoadingState extends EditProfileState {}
