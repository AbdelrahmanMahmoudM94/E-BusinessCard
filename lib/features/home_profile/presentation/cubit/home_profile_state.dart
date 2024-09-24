part of 'home_profile_cubit.dart';

abstract class HomeProfileState {}

final class HomeProfileInitial extends HomeProfileState {}

class HomeProfileLoadingState extends HomeProfileState {}

final class HomeProfileErrorState extends HomeProfileState {
  HomeProfileErrorState({this.message});

  final String? message;
}

class HomeProfileReadyState extends HomeProfileState {
  HomeProfileReadyState({
    required this.homeProfileEntity,
    this.pageNumber,
    this.searchText,
    this.hasMorePages = false,
    this.isLoading = false,
    this.errorHappens = false,
  });

  bool hasMorePages;

  int? pageNumber;
  final bool isLoading;
  final HomeProfileEntity homeProfileEntity;
  final bool errorHappens;
  final String? searchText;
}
