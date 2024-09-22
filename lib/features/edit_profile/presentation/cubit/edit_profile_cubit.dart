import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_profile_request_model.dart';
import 'package:karty/features/edit_profile/domain/entities/profile_entity.dart';
import 'package:karty/features/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this.editProfileUseCase})
      : super(EditProfileInitial());
  final EditProfileUseCase editProfileUseCase;

  Future<void> editProfile(
      {required EditProfileRequestModel editProfileRequestModel}) async {
    emit(EditProfileLoadingState());
    final CustomResponseType<BaseEntity<ProfileEntity>>
        eitherPackagesOrFailure =
        await editProfileUseCase(EditProfileRequestModel(
      comments: editProfileRequestModel.comments,
      email: editProfileRequestModel.email,
    ));

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();

      emit(EditProfileErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<ProfileEntity> response) {
      emit(EditProfileSuccessState());
    });
  }
}
