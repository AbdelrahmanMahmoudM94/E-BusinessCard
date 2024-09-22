import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karty/features/common/constants.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';

import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/routes/routes.dart';
import 'package:karty/features/shared/cubit/language/theme_cubit.dart';
import 'package:karty/features/shared/data/local_data.dart';
import 'package:karty/main.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ThemeToggleWidget extends StatefulWidget {
  ThemeToggleWidget({super.key});

  @override
  State<ThemeToggleWidget> createState() => _ThemeToggleWidgetState();
}

class _ThemeToggleWidgetState extends State<ThemeToggleWidget> {
  bool _checkboxLight = true;

  bool _checkboxDark = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: <Widget>[
          10.heightBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(
                "assets/svg/more-dark-light-icon.svg",
                width: 30.w,
              ),
              10.widthBox,
              ToggleSwitch(
                minWidth: LanguageHelper.isAr(context) ? 100.w : 80.w,
                minHeight: 25.h,
                fontSize: 16.sp,
                borderColor: <Color>[Palette.greyDivider],
                borderWidth: 1,
                initialLabelIndex: LocalData.getApplicationTheme() != null &&
                        LocalData.getApplicationTheme()!
                    ? 1
                    : 0,
                activeBgColor: <Color>[Palette.lightBlue],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: AppTheme.inDarkMode(
         context,
                    dark: Palette.black,
                    light: Palette.black),
                totalSwitches: 2,
                textDirectionRTL: context.locale == Locale('ar', 'KW'),
                labels: <String>[
                  context.tr("lightLook"),
                  context.tr("darkLook")
                ],
                onToggle: (int? index) async {
                  if (index == 1) {
                    _checkboxDark = true;
                    _checkboxLight = false;

                    MyApp.of(context).changeTheme(ThemeMode.dark);
                    await LocalData.setApplicationTheme(true);
                  } else {
                    _checkboxDark = false;
                    _checkboxLight = true;
                    MyApp.of(context).changeTheme(ThemeMode.light);
                    await LocalData.setApplicationTheme(false);
                    // ConstantsObjects.navigatorKey.currentContext!
                    //     .read<ThemeCubit>()
                    //     .changeTheme(ThemeMode.light);
                  }
                },
              ),
            ],
          ),
          10.heightBox,
          Divider(
            color: Palette.grey_D4CDCD,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
