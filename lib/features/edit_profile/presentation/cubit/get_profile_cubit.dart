import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/edit_profile/domain/use_cases/get_profile_use_case.dart';
import 'package:karty/features/edit_profile/presentation/cubit/get_profile_state.dart';
import 'package:karty/features/home_profile/domain/entities/home_profile_entity.dart';

@injectable
class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit({required this.getProfileUseCase})
      : super(GetProfileInitialState());

  final GetProfileUseCase getProfileUseCase;

//local profile
  Future<void> getProfile() async {
    final CustomResponseType<HomeProfileEntity> eitherPackagesOrFailure =
        await getProfileUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      emit(GetProfileErrorState(
        message: FailureToMassage().mapFailureToMessage(failure),
      ));
    }, (HomeProfileEntity response) {
      emit(GetProfileReadyState(homeProfileEntity: response));
    });
  }

  //local profile
  Future<CustomResponseType<HomeProfileEntity>> getLocalProfile() async {
    return await getProfileUseCase();
  }
}
