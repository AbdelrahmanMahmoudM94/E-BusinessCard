import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/Home_profile/domain/use_cases/Home_profile_use_case.dart';
import 'package:karty/features/home_profile/data/models/response/home_profile_response_model.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

import '../../data/models/request/home_profile_request_model.dart';

part 'home_profile_state.dart';

@injectable
class HomeProfileCubit extends Cubit<HomeProfileState> {
  HomeProfileCubit({required this.homeProfileUseCase})
      : super(HomeProfileInitial());
  final HomeProfileUseCase homeProfileUseCase;

  Future<void> getProfile(
      {required HomeProfileRequestModel homeProfileRequestModel}) async {
    emit(HomeProfileLoadingState());

    final CustomResponseType<BaseEntity<HomeProfileResponseModel>>
        eitherPackagesOrFailure =
        await homeProfileUseCase(homeProfileRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      emit(HomeProfileErrorState(
        message: FailureToMassage().mapFailureToMessage(failure),
      ));
    }, (BaseEntity<HomeProfileResponseModel> response) {
      if (response.data == true) {
        emit(HomeProfileReadyState(homeProfileResponseModel: response.data!));
      } else {
        emit(HomeProfileErrorState(
          message: response.message,
        ));
      }
    });
  }
}
