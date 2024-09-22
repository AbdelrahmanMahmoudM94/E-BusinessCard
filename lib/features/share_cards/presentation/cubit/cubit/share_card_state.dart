part of 'share_card_cubit.dart';

abstract class ShareCardState {}

final class ShareCardInitialState extends ShareCardState {}

final class ShareCardLoadingState extends ShareCardState {}

final class ShareCardReadyState extends ShareCardState {
  ShareCardReadyState({
    required this.shareCardList,
    required this.shareCardsRequestModel,
    this.pageNumber,
    this.searchText,
    this.hasMorePages = false,
    this.isLoading = false,
    this.errorHappens = false,
  });

  bool hasMorePages;

  final List<ShareCardEntity> shareCardList;
  int? pageNumber;
  final bool isLoading;
  final ShareCardsRequestModel shareCardsRequestModel;
  final bool errorHappens;
  final String? searchText;
}

class ShareCardErrorState extends ShareCardState {
  ShareCardErrorState({this.message});

    final String? message;

}

final class ContactDetailsLoadingState extends ShareCardState {}

final class ContactDetailsReadyState extends ShareCardState {
  ContactDetailsReadyState({
    required this.contactDetailsEntity,
  });

  final ContactDetailsEntity contactDetailsEntity;
}

class ContactDetailsErrorState extends ShareCardState {}
