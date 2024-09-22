import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karty/features/common/constants.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/encrypt_data.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';

import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/login/presentation/cubit/cubit/login_cubit.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/routes/routes.gr.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/custom_elevated_button_widget.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacityLogo = 0.0;
  double _opacityText = 0.0;
  double _topPositionLogo = 280.h;
  double _topPositionText = 460.h;

  @override
  void initState() {
    FlutterNativeSplash.remove();
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _opacityLogo = 1.0;
      });
    });
    Timer(const Duration(milliseconds: 800), () {
      setState(() {
        _opacityText = 1.0;
      });
    });
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _topPositionLogo = 300.h;
      });
    });
    Timer(const Duration(milliseconds: 800), () {
      setState(() {
        _topPositionText = 470.h;
      });
    });
    Timer(const Duration(seconds: 2), () {
      CustomMainRouter.push(const LoginRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.inDarkMode(context,
            dark: Palette.black, light: Palette.white),
        child: Stack(
          children: <Widget>[
            SvgPicture.asset(
              height: 1.sh,
              "assets/svg/splash-background.svg",
              fit: BoxFit.cover,
            ),
            AnimatedPositioned(
              //   width: 90.w,
              top: _topPositionLogo,
              left: 0,
              right: 0,
              duration: const Duration(milliseconds: 300),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _opacityLogo,
                child: LanguageHelper.isAr(context)
                    ? Image.asset(
                        "assets/png/company_arabic_logo.png",
                        height: 100.w,
                      )
                    : SvgPicture.asset(
                        ViewsToolbox.getDiyarLogo(context),
                        width: 160.w,
                      ),
              ),
            ),
            Positioned(
              top: 450.h,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: _opacityLogo,
                duration: const Duration(milliseconds: 400),
                child: Divider(
                  color: AppTheme.inDarkMode(context,
                      dark: Palette.white, light: Palette.lightGrey),
                  endIndent: 0.3.sw,
                  indent: 0.3.sw,
                  thickness: 1,
                ),
              ),
            ),
            AnimatedPositioned(
              top: _topPositionText,
              left: 0,
              right: 0,
              duration: const Duration(milliseconds: 300),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _opacityText,
                child: AppText(
                  text: context.tr("E-BusinessCard"),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bold_18,
                ),
              ),
            ),
            Positioned(
              top: 500.h,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                opacity: _opacityText,
                child: Divider(
                  color: AppTheme.inDarkMode(context,
                      dark: Palette.white, light: Palette.lightGrey),
                  endIndent: 0.3.sw,
                  indent: 0.3.sw,
                  thickness: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
