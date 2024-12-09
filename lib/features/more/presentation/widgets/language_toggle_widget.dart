import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/shared/data/local_data.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LanguageToggleWidget extends StatefulWidget {
  LanguageToggleWidget({super.key});

  @override
  State<LanguageToggleWidget> createState() => _LanguageToggleWidgetState();
}

class _LanguageToggleWidgetState extends State<LanguageToggleWidget> {
  bool _checkboxEn = true;

  bool _checkboxAr = false;

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
                "assets/svg/more-language-icon.svg",
                width: 25.w,
              ),
              10.widthBox,
              ToggleSwitch(
                minWidth: 80.w,
                minHeight: 25.h,
                fontSize: 16.sp,
                borderColor: <Color>[Palette.greyDivider],
                borderWidth: 1,
                initialLabelIndex: 0,
                activeBgColor: <Color>[Palette.lightBlue],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: AppTheme.inDarkMode(context,
                    dark: Palette.black, light: Palette.black),
                totalSwitches: 2,
                textDirectionRTL: context.locale == Locale('ar', 'KW'),
                labels: context.locale == Locale('ar', 'KW')
                    ? <String>['عربي', 'English']
                    : <String>['English', 'عربي'],
                onToggle: (int? index) async {
                  if (index == 1) {
                    if (_checkboxEn) {
                      context.setLocale(Locale('ar', 'KW'));
                      await LocalData.setLangCode("ar");

                      _checkboxAr = true;
                      _checkboxEn = false;
                    } else {
                      _checkboxEn = true;
                      _checkboxAr = false;

                      await context.setLocale(Locale('en', 'US'));
                      await LocalData.setLangCode("en");
                    }
                  } else {
                    if (_checkboxEn) {
                      await context.setLocale(const Locale('ar', 'KW'));
                      await LocalData.setLangCode("ar");
                      _checkboxAr = true;
                      _checkboxEn = false;
                    } else {
                      _checkboxEn = true;
                      _checkboxAr = false;

                      await context.setLocale(const Locale('en', 'US'));
                      await LocalData.setLangCode("en");
                    }
                  }
                  _setLanguage();
                  setState(() {});
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

  void _setLanguage() {
    LanguageHelper.setCurrentAcceptLanguage(_checkboxAr ? "ar-KW" : "en-US");
    LanguageHelper.setCurrentLanguage(_checkboxAr ? "ar" : "en");
  }
}

class VersionCard extends StatelessWidget {
  const VersionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      color: Palette.primaryColor,
      child: Center(
        child: AppText(
          text: "Version: 2.4",
          textColor: Palette.white,
          style: AppTextStyle.medium_14,
        ),
      ),
    );
  }
}
