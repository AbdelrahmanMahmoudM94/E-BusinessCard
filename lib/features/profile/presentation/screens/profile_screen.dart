import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';

import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/profile/presentation/widgets/circle_actions_widget.dart';
import 'package:karty/features/profile/presentation/widgets/profile_card_list_widget.dart';
import 'package:karty/features/profile/presentation/widgets/profile_personal_data_widget.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/routes/routes.gr.dart';
import 'package:karty/features/share_cards/domain/entities/contact_profile_entity.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/background_pattern.dart';
import 'package:karty/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:karty/features/splash/presentation/screens/splash_screen.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late CarouselSliderController _carouselSliderController;

  @override
  void initState() {
    _carouselSliderController = CarouselSliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      path: "assets/svg/profile-background.svg",
      patternExtension: PatternExtension.svg,
      widget: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            50.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: <Widget>[
                        CircleActionsWidget(
                          icon: FontAwesomeIcons.refresh,
                          onPressed: () {},
                        ),
                        15.widthBox,
                        CircleActionsWidget(
                          icon: Icons.edit,
                          onPressed: () {
                            CustomMainRouter.push(EditProfileRoute());
                          },
                        ),
                      ],
                    ),
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
            ProfilePersonalDataWidget(
              name: "Fuad Taha",
              companyName: "Diyar United Arab",
              isStatic: true,
            ),
            35.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ProfileCardsListWidget(
                carouselSliderController: _carouselSliderController,
                profiles: <ContactProfileEntity>[
                  ContactProfileEntity(
                    email: "F.Taha@diyarme.com",
                    companyName: "Diyar United Company",
                    location: "Kuwait",
                    position: "Director",
                    phoneNumber: "123456",
                  ),
                  ContactProfileEntity(
                    email: "F.Taha@diyarme.com",
                    companyName: "Diyar United Company",
                    location: "Kuwait",
                    position: "Unit Manager",
                    phoneNumber: "123456",
                  ),
                ],
              ),
            ),
            100.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomElevatedButton(
                  onPressed: () {},
                  height: 64.h,
                  width: 180.w,
                  customChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset("assets/svg/qrCode-icon.svg"),
                      10.widthBox,
                      AppText(
                        text: context.tr("myQrCode"),
                        textColor: Palette.white,
                        style: AppTextStyle.bold_18,
                      )
                    ],
                  ),
                  radius: 20.r,
                  borderColor: Colors.transparent,
                  gradient: LinearGradient(colors: <Color>[
                    Palette.blue_058DD2,
                    Palette.blue_0672A8
                  ]),
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  height: 64.h,
                  width: 180.w,
                  customChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset("assets/svg/share-icon.svg"),
                      10.widthBox,
                      AppText(
                        text: context.tr("share"),
                        textColor: Palette.white,
                        style: AppTextStyle.bold_18,
                      )
                    ],
                  ),
                  radius: 20.r,
                  borderColor: Colors.transparent,
                  gradient: LinearGradient(colors: <Color>[
                    Palette.blue_0DBDFF,
                    Palette.blue_05A3DF
                  ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
