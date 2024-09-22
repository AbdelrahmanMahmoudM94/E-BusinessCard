import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';

import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/more/presentation/widgets/language_toggle_widget.dart';
import 'package:karty/features/more/presentation/widgets/theme_toggle_widget.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/routes/routes.gr.dart';
import 'package:karty/features/shared/data/local_data.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/background_pattern.dart';

@RoutePage()
class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  String? appVersion;
  @override
  void initState() {
    getAppVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
        path: "assets/png/more-background.png",
        patternExtension: PatternExtension.png,
        patternHeight: 150.h,
        widget: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                70.heightBox,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.inDarkMode(context,
                            dark: Palette.semiLightBlack, light: Palette.white),
                        border: Border.all(
                            color: AppTheme.inDarkMode(context,
                                dark: Palette.semiLightBlack,
                                light: Palette.greyDivider)!)),
                    child: Center(
                      child: LanguageHelper.isAr(context)
                          ? Image.asset(
                              "assets/png/company_arabic_logo.png",
                              width: 100.w,
                            )
                          : SvgPicture.asset(
                              ViewsToolbox.getDiyarLogo(context),
                              width: 90.w,
                            ),
                    ),
                  ),
                ),
                20.heightBox,
                IconWithText(
                  text: context.tr("requestProfileUpdate"),
                  icon: "more-user-edit-icon.svg",
                  onTap: () => CustomMainRouter.push(EditProfileRoute()),
                ),
                10.heightBox,
                // IconWithText(
                //   onTap: () => CustomRouter.push(NavigationMainRoute(
                //       children: <PageRouteInfo>[ShareCardsRoute()])),
                //   text: context.tr("myContacts"),
                //   icon: "more-contact-icon.svg",
                // ),
                // 10.heightBox,
                IconWithText(
                  text: context.tr("faq"),
                  icon: "more-help-icon.svg",
                  onTap: () => CustomMainRouter.push(FaqRoutes()),
                ),
                10.heightBox,
                LanguageToggleWidget(),
                10.heightBox,
                10.heightBox,
                ThemeToggleWidget(),
                10.heightBox,
                IconWithText(
                  text: context.tr("logout"),
                  icon: "more-logout-icon.svg",
                  onTap: () => CustomMainRouter.push(LoginRoute()),
                ),
                20.heightBox,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: AppText(
                    text: "Version: $appVersion",
                    textColor: Palette.primaryColor,
                    style: AppTextStyle.bold_18,
                  ),
                ),
                // Spacer(),
                // VersionCard(),
              ]),
        ));
  }

  Future<void> getAppVersion() async {
    if (Platform.isIOS) {
      appVersion = await LocalData.getAppIosVersion();
    } else {
      appVersion = await LocalData.getAppAndroidVersion();
    }
    setState(() {});
  }
}

class IconWithText extends StatelessWidget {
  IconWithText({
    required this.icon,
    required this.text,
    this.onTap,
    this.hasDivider = true,
  });
  final String text;
  final String icon;
  final bool hasDivider;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SvgPicture.asset(
                  "assets/svg/$icon",
                  width: 25.w,
                ),
                10.widthBox,
                AppText(
                  text: text,
                  textLimit: 23,
                  substringForDots: 1,
                  style: AppTextStyle.semiBold_18,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            20.heightBox,
            hasDivider
                ? Divider(
                    color: Palette.grey_D4CDCD,
                    thickness: 1,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
