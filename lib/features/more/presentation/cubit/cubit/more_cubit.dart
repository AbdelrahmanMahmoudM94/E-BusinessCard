import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/common/constants.dart';
import 'package:karty/features/more/domain/entities/faq_entity.dart';
import 'package:karty/features/more/domain/usecases/get_all_faq_use_case.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'more_state.dart';

@injectable
class MoreCubit extends Cubit<MoreState> {
  MoreCubit({
    required this.getAllFaqListUseCase,
  }) : super(MoreInitial());
  final GetAllFaqListUseCase getAllFaqListUseCase;

  Future<void> getAllFaqList(String lang) async {
    final CustomResponseType<BaseEntity<List<FaqEntity>>>
        eitherPackagesOrFailure = await getAllFaqListUseCase(lang);

    eitherPackagesOrFailure.fold((Failure failure) {},
        (BaseEntity<List<FaqEntity>> response) {
      emit(FaqReadyState(faqList: response.data!));
    });
  }
}
