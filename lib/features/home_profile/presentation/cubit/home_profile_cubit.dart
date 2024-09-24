import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/edit_profile/presentation/cubit/get_profile_cubit.dart';
import 'package:karty/features/home_profile/domain/entities/home_profile_entity.dart';
import 'package:karty/features/home_profile/domain/use_cases/home_profile_use_case.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

import '../../data/models/request/home_profile_request_model.dart';

part 'home_profile_state.dart';

@injectable
class HomeProfileCubit extends Cubit<HomeProfileState> {
  HomeProfileCubit({required this.homeProfileUseCase})
      : super(HomeProfileInitial());
  final HomeProfileUseCase homeProfileUseCase;

/* Get profile:
1- get profile from server if success emit HomeProfileReadyState
2- if failed get profile from local storage and emit HomeProfileReadyState
3- if failed to get profile from local storage emit HomeProfileErrorState
*/
  Future<void> getProfile(
      {required HomeProfileRequestModel homeProfileRequestModel}) async {
    emit(HomeProfileLoadingState());

    final CustomResponseType<BaseEntity<HomeProfileEntity>>
        eitherPackagesOrFailure =
        await homeProfileUseCase(homeProfileRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) async {
      GetProfileCubit _getProfileCubit = getIt<GetProfileCubit>();
      Either<Failure, HomeProfileEntity> localProfile =
          await _getProfileCubit.getLocalProfile();

      localProfile.fold((Failure failure) {
        emit(HomeProfileErrorState(
          message: FailureToMassage().mapFailureToMessage(failure),
        ));
      }, (HomeProfileEntity response) {
        emit(HomeProfileReadyState(homeProfileEntity: response));
      });
    }, (BaseEntity<HomeProfileEntity> response) {
      emit(HomeProfileReadyState(homeProfileEntity: response.data!));
    });
  }

  Future<void> refreshProfile(
      {required HomeProfileRequestModel homeProfileRequestModel}) async {
    HomeProfileReadyState currentHomeProfileReadyState =
        state as HomeProfileReadyState;

    emit(HomeProfileReadyState(
        homeProfileEntity: currentHomeProfileReadyState.homeProfileEntity,
        isLoading: true));

    emit(HomeProfileLoadingState());

    final CustomResponseType<BaseEntity<HomeProfileEntity>>
        eitherPackagesOrFailure =
        await homeProfileUseCase(homeProfileRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      emit(HomeProfileReadyState(
        homeProfileEntity: currentHomeProfileReadyState.homeProfileEntity,
        //TODO: where to send error message ?
      ));

      // emit(HomeProfileErrorState(
      //   message: FailureToMassage().mapFailureToMessage(failure),
      // ));
    }, (BaseEntity<HomeProfileEntity> response) {
      emit(HomeProfileReadyState(homeProfileEntity: response.data!));
    });
  }
}
