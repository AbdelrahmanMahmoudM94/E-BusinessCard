import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/features/common/utility/theme.dart';

part 'theme_state.dart';

@injectable
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.lightTheme);

  Future<void> changeTheme(ThemeMode themeMode) async {
    if (themeMode == ThemeMode.dark) {
      emit(AppTheme.darkTheme);
    } else {
      emit(AppTheme.lightTheme);
    }
  }
}
