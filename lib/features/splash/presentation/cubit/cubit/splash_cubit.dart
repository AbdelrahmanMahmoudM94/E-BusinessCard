import 'package:bloc/bloc.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
}
