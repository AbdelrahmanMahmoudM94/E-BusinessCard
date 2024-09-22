import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
import 'package:karty/features/login/presentation/widgets/language_button_widget.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/routes/routes.gr.dart';
import 'package:karty/features/shared/data/local_data.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:karty/features/shared/widgets/forms/email_field_widget.dart';
import 'package:karty/features/shared/widgets/forms/password_field_widget.dart';
import 'package:karty/features/splash/presentation/screens/splash_screen.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _checkboxEn = true;

  bool _checkboxAr = false;
  LoginCubit _loginCubit = getIt<LoginCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: InkWell(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: <Widget>[
              SvgPicture.asset(
                AppTheme.isDarkMode(context)
                    ? "assets/svg/login-background-dark.svg"
                    : "assets/svg/login-background.svg",
                width: 1.sw,
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      80.heightBox,
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50.w,
                        ),
                        child: context.locale == Locale('en', 'US')
                            ? Row(
                                children: <Widget>[
                                  LanguageButtonWidget(
                                    text: "En",
                                    isSelected:
                                        context.locale == Locale('en', 'US'),
                                    onTap: () async {
                                      setState(() {
                                        _checkboxEn = true;
                                        _checkboxAr = false;
                                      });
                                      await context
                                          .setLocale(Locale('en', 'US'));
                                      await LocalData.setLangCode("en");
                                    },
                                  ),
                                  10.widthBox,
                                  LanguageButtonWidget(
                                    text: "ع",
                                    isSelected:
                                        context.locale == Locale('ar', 'KW'),
                                    onTap: () async {
                                      setState(() {
                                        _checkboxEn = false;
                                        _checkboxAr = true;
                                      });
                                      await context
                                          .setLocale(Locale('ar', 'KW'));
                                      await LocalData.setLangCode("ar");
                                    },
                                  ),
                                ],
                              )
                            : Row(
                                children: <Widget>[
                                  LanguageButtonWidget(
                                    text: "ع",
                                    isSelected:
                                        context.locale == Locale('ar', 'KW'),
                                    onTap: () async {
                                      setState(() {
                                        _checkboxEn = false;
                                        _checkboxAr = true;
                                      });
                                      await context
                                          .setLocale(Locale('ar', 'KW'));
                                      await LocalData.setLangCode("ar");
                                    },
                                  ),
                                  10.widthBox,
                                  LanguageButtonWidget(
                                    text: "En",
                                    isSelected:
                                        context.locale == Locale('en', 'US'),
                                    onTap: () async {
                                      setState(() {
                                        _checkboxEn = true;
                                        _checkboxAr = false;
                                      });
                                      await context
                                          .setLocale(Locale('en', 'US'));
                                      await LocalData.setLangCode("en");
                                    },
                                  ),
                                ],
                              ),
                      ),
                      20.heightBox,
                      LanguageHelper.isAr(context)
                          ? Image.asset(
                              "assets/png/company_arabic_logo.png",
                              width: 140.w,
                            )
                          : SvgPicture.asset(
                              ViewsToolbox.getDiyarLogo(context),
                              width: 140.w,
                            ),
                      30.heightBox,
                      SvgPicture.asset(
                        "assets/svg/login-user-icon.svg",
                      ),
                      10.heightBox,
                      AppText(
                        text: context.tr("loginToYourAccount"),
                        textColor: AppTheme.isDarkMode(context)
                            ? Palette.white
                            : Palette.darkBlue,
                        style: AppTextStyle.bold_17,
                      ),
                      Divider(
                        color: Palette.lightBlue,
                        thickness: 3,
                        endIndent: 0.40.sw,
                        indent: 0.40.sw,
                      ),
                      30.heightBox,
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                      //   child: EmailFieldWidget(
                      //     keyName: "email",
                      //     labelAboveField: context.tr("email"),
                      //     contentPadding: EdgeInsets.symmetric(
                      //       vertical: 22.h,
                      //       horizontal: 20.w,
                      //     ),
                      //     suffixIcon: Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 15.w),
                      //       child: IconButton(
                      //         icon: SvgPicture.asset(
                      //             "assets/svg/email-login-icon.svg",
                      //             width: 20.w,
                      //             colorFilter: ColorFilter.mode(
                      //                 AppTheme.inDarkMode(context,
                      //                     dark: Palette.white,
                      //                     light: Palette.black)!,
                      //                 BlendMode.srcIn)),
                      //         onPressed: () {},
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // 20.heightBox,
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                      //   child: PasswordFieldWidget(
                      //     keyName: "password",
                      //     labelAboveField: context.tr("password"),
                      //     contentPadding: EdgeInsets.symmetric(
                      //       vertical: 22.h,
                      //       horizontal: 20.w,
                      //     ),
                      //     hintText: context.tr("passwordHint"),
                      //     hintStyle: TextStyle(
                      //         color: Palette.grey_707070,
                      //         fontSize: 17.sp,
                      //         fontWeight: FontWeight.w600),
                      //     suffixIcon: Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 15.w),
                      //       child: IconButton(
                      //         icon: SvgPicture.asset("assets/svg/lock-icon.svg",
                      //             width: 20.w,
                      //             colorFilter: ColorFilter.mode(
                      //                 AppTheme.inDarkMode(context,
                      //                     dark: Palette.white,
                      //                     light: Palette.black)!,
                      //                 BlendMode.srcIn)),
                      //         onPressed: () {},
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      30.heightBox,
                      CustomElevatedButton(
                        onPressed: () {
                          _loginCubit.getAppConfig(email: "F.Taha@diyarme.com");
                          CustomMainRouter.navigate(
                              NavigationMainRoute(children: <PageRouteInfo>[
                            ProfileRoute(),
                          ]));
                        },
                        height: 64.h,
                        width: 390.w,
                        radius: 20.r,
                        text: context.tr("signIn"),
                        textStyle: AppTextStyle.bold_18,
                        borderColor: Colors.transparent,
                        gradient: LinearGradient(colors: <Color>[
                          Palette.blue_0DBDFF,
                          Palette.blue_05A3DF
                        ]),
                      ),
                      50.heightBox,
                      AppText(
                        text: context.tr("forgetPassword"),
                        style: AppTextStyle.medium_17,
                      ),
                      Divider(
                        color: AppTheme.inDarkMode(context,
                            dark: Palette.white, light: Palette.black),
                        thickness: 1,
                        endIndent: 0.33.sw,
                        indent: 0.33.sw,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
