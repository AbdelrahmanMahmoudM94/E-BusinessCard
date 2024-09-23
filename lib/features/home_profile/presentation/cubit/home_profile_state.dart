part of 'home_profile_cubit.dart';

abstract class HomeProfileState {}

final class HomeProfileInitial extends HomeProfileState {}

class HomeProfileErrorState extends HomeProfileState {
  HomeProfileErrorState({this.message});

  final String? message;
}

class HomeProfileLoadingState extends HomeProfileState {}

class HomeProfileReadyState extends HomeProfileState {
  HomeProfileReadyState({
    required this.homeProfileResponseModel,
    this.pageNumber,
    this.searchText,
    this.hasMorePages = false,
    this.isLoading = false,
    this.errorHappens = false,
  });

  bool hasMorePages;

  int? pageNumber;
  final bool isLoading;
  final HomeProfileResponseModel homeProfileResponseModel;
  final bool errorHappens;
  final String? searchText;
}
