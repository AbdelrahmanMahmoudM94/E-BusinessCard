import 'package:karty/features/home_profile/domain/entities/home_profile_entity.dart';

abstract class GetProfileState {}

final class GetProfileInitialState extends GetProfileState {}

class GetProfileReadyState extends GetProfileState {
  GetProfileReadyState({required this.homeProfileEntity});

  final HomeProfileEntity homeProfileEntity;
}

class GetProfileErrorState extends GetProfileState {
  GetProfileErrorState({this.message});

  final String? message;
}

class GetProfileLoadingState extends GetProfileState {}
