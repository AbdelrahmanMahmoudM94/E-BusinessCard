import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/share_cards/data/models/request/contact_details_request.dart';
import 'package:karty/features/share_cards/data/models/request/share_card_request_model.dart';
import 'package:karty/features/share_cards/domain/entities/contact_details_entity.dart';
import 'package:karty/features/share_cards/domain/entities/shard_card_entity.dart';
import 'package:karty/features/share_cards/domain/use_cases/get_all_share_cards_list_use_case.dart';
import 'package:karty/features/share_cards/domain/use_cases/get_contact_details_use_case.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'share_card_state.dart';

@injectable
class ShareCardCubit extends Cubit<ShareCardState> {
  ShareCardCubit(
      {required this.getAllShareCardsListUseCase,
      required this.getContactDetailsUseCase})
      : super(ShareCardInitialState());
  final GetAllShareCardsListUseCase getAllShareCardsListUseCase;
  final GetContactDetailsUseCase getContactDetailsUseCase;

  Future<void> getAllShareCardsList(
      {required ShareCardsRequestModel shareRequestModel,
      bool isSearched = false}) async {
    ShareCardReadyState shareCardReadyState;
    if (isSearched) {
      shareCardReadyState = state as ShareCardReadyState;
      emit(ShareCardReadyState(
          shareCardList: shareCardReadyState.shareCardList,
          isLoading: true,
          shareCardsRequestModel: shareCardReadyState.shareCardsRequestModel,
          pageNumber: shareCardReadyState.pageNumber,
          searchText: shareCardReadyState.searchText,
          hasMorePages: shareCardReadyState.hasMorePages));
    } else {
      emit(ShareCardLoadingState());
    }
    final CustomResponseType<BaseEntity<List<ShareCardEntity>>>
        eitherPackagesOrFailure =
        await getAllShareCardsListUseCase(ShareCardsRequestModel(
      PageNumber: 1,
      PageSize: 10,
      email: shareRequestModel.email,
      lang: shareRequestModel.lang,
      searchText: shareRequestModel.searchText,
    ));

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();

      log(failure.toString());
      emit(ShareCardErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<ShareCardEntity>> response) {
      emit(ShareCardReadyState(
          shareCardList: response.message == "No data"
              ? <ShareCardEntity>[]
              : response.data!,
          hasMorePages: response.hasMorePages!,
          pageNumber: 1,
          searchText: shareRequestModel.searchText,
          shareCardsRequestModel: shareRequestModel));
    });
  }

  Future<void> loadMoreShareCardsList() async {
    ShareCardReadyState currentState = state as ShareCardReadyState;
    //  emit(ShareCardReadyState(shareCardList: currentState.shareCardList,))

    emit(ShareCardReadyState(
        shareCardList: currentState.shareCardList,
        isLoading: true,
        shareCardsRequestModel: currentState.shareCardsRequestModel,
        pageNumber: currentState.pageNumber,
        searchText: currentState.searchText,
        hasMorePages: currentState.hasMorePages));
    currentState.pageNumber = currentState.pageNumber! + 1;
    final CustomResponseType<BaseEntity<List<ShareCardEntity>>>
        eitherPackagesOrFailure =
        await getAllShareCardsListUseCase(ShareCardsRequestModel(
      PageNumber: currentState.pageNumber,
      PageSize: 10,
      email: currentState.shareCardsRequestModel.email,
      lang: currentState.shareCardsRequestModel.lang,
      searchText: currentState.shareCardsRequestModel.searchText,
    ));

    eitherPackagesOrFailure.fold((Failure failure) {
      emit(ShareCardReadyState(
          shareCardList: currentState.shareCardList,
          shareCardsRequestModel: currentState.shareCardsRequestModel,
          pageNumber: currentState.pageNumber,
          searchText: currentState.searchText,
          hasMorePages: currentState.hasMorePages));
    }, (BaseEntity<List<ShareCardEntity>> response) {
      emit(ShareCardReadyState(
          shareCardList: response.message == "No data"
              ? <ShareCardEntity>[]
              : currentState.shareCardList + response.data!,
          hasMorePages: response.hasMorePages!,
          searchText: currentState.searchText,
          shareCardsRequestModel: currentState.shareCardsRequestModel,
          pageNumber: currentState.pageNumber));
    });
  }

  Future<void> getContactDetails(
      {required ContactDetailsRequestModel contactDetailsRequestModel}) async {
    emit(ContactDetailsLoadingState());
    final CustomResponseType<BaseEntity<ContactDetailsEntity>>
        eitherPackagesOrFailure =
        await getContactDetailsUseCase(contactDetailsRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      emit(ContactDetailsErrorState());
    }, (BaseEntity<ContactDetailsEntity> response) {
      emit(ContactDetailsReadyState(contactDetailsEntity: response.data!));
    });
  }
}
