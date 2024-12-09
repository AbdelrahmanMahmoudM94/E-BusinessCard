import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/edit_profile/presentation/widgets/my_details_widget.dart';
import 'package:karty/features/edit_profile/presentation/widgets/social_media_widget.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/background_pattern.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _myDetailsActive = true;
  bool _socialMedia = false;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      path: "assets/png/profile-update-pattern.png",
      patternExtension: PatternExtension.png,
      patternHeight: 130.h,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          50.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () => CustomMainRouter.pop(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(0.0),
                          width: 20.w,
                          child: Icon(
                            color: Palette.white,
                            LanguageHelper.isAr(context)
                                ? FontAwesomeIcons.arrowRight
                                : FontAwesomeIcons.arrowLeft,
                            size: 30.w,
                          ),
                        ),
                      ),
                    ),
                    4.widthBox,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: AppText(
                        text: context.tr("profileUpdate").toUpperCase(),
                        style: AppTextStyle.bold_21,
                        textColor: Palette.white,
                      ),
                    ),
                  ],
                ),
                LanguageHelper.isAr(context)
                    ? Image.asset(
                        "assets/png/company_arabic_logo.png",
                        width: 100.w,
                      )
                    : SvgPicture.asset(
                        ViewsToolbox.getDiyarLogo(context,
                            forcedLightTheme: true),
                        width: 110.w,
                      )
              ],
            ),
          ),
          10.heightBox,
          Expanded(
            child: Container(
              color:
                  AppTheme.isDarkMode(context) ? Palette.black : Palette.white,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      25.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Tag(
                            text: context.tr("myDetails"),
                            onTap: () {
                              _pageController.jumpToPage(0);
                              setState(() {
                                _myDetailsActive = true;
                                _socialMedia = false;
                              });
                            },
                            isSelected: _myDetailsActive,
                            dividerWidth: 0.23.sw,
                          ),
                          Tag(
                            text: context.tr("socialMedia"),
                            onTap: () {
                              _pageController.jumpToPage(1);
                              setState(() {
                                _myDetailsActive = false;
                                _socialMedia = true;
                              });
                            },
                            dividerWidth: 0.28.sw,
                            isSelected: _socialMedia,
                          )
                        ],
                      ),
                      5.heightBox,
                      Divider(
                        color: Palette.grey_858c9e,
                        thickness: 1,
                      ),
                      20.heightBox,
                      ExpandablePageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        children: <Widget>[
                          MyDetailsWidget(),
                          SocialMediaWidget()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  const Tag(
      {super.key,
      required this.text,
      this.onTap,
      this.isSelected = true,
      required this.dividerWidth});

  final void Function()? onTap;
  final bool isSelected;
  final String text;
  final double dividerWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          AppText(
            text: text,
            textColor: isSelected
                ? AppTheme.inDarkMode(context,
                    dark: Palette.white, light: Palette.darkBlue)
                : Palette.grey_858c9e,
            style: AppTextStyle.bold_17,
          ),
          Container(
            width: dividerWidth,
            child: Divider(
              color: isSelected
                  ? AppTheme.inDarkMode(context,
                      dark: Palette.white, light: Palette.darkBlue)
                  : Colors.transparent,
              thickness: 4.w,
            ),
          )
        ],
      ),
    );
  }
}
