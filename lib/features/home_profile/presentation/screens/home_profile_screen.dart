import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/home_profile/data/models/request/home_profile_request_model.dart';
import 'package:karty/features/home_profile/data/models/response/home_profile_item_response_model.dart';
import 'package:karty/features/home_profile/presentation/cubit/home_profile_cubit.dart';
import 'package:karty/features/home_profile/presentation/widgets/circle_actions_widget.dart';
import 'package:karty/features/home_profile/presentation/widgets/profile_card_list_widget.dart';
import 'package:karty/features/home_profile/presentation/widgets/profile_personal_data_widget.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/routes/routes.gr.dart';
import 'package:karty/features/share_cards/domain/entities/contact_profile_entity.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/background_pattern.dart';
import 'package:karty/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:karty/features/shared/widgets/no_data_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class HomeProfileScreen extends StatefulWidget {
  const HomeProfileScreen({super.key});

  @override
  State<HomeProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<HomeProfileScreen> {
  late CarouselSliderController _carouselSliderController;
  HomeProfileCubit _homeProfileCubit = getIt<HomeProfileCubit>();
  BuildContext? _qrContext;
  @override
  void initState() {
    _carouselSliderController = CarouselSliderController();

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      _homeProfileCubit.getProfile(
          homeProfileRequestModel: HomeProfileRequestModel(
              email: "F.Taha@diyarme.com",
              lang: LanguageHelper.isAr(context) ? "a" : "e"));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeProfileCubit>.value(
      value: _homeProfileCubit,
      child: BackgroundPattern(
          path: "assets/svg/profile-background.svg",
          patternExtension: PatternExtension.svg,
          widget: SingleChildScrollView(
            child: BlocConsumer<HomeProfileCubit, HomeProfileState>(
              listener: (BuildContext context, HomeProfileState state) {
                if (state is HomeProfileLoadingState) {
                  ViewsToolbox.showLoading();
                } else if (state is HomeProfileReadyState) {
                  if (state.isLoading) {
                    ViewsToolbox.showLoading();
                  } else {
                    ViewsToolbox.dismissLoading();
                  }
                } else if (state is HomeProfileErrorState) {
                  ViewsToolbox.dismissLoading();
                  ViewsToolbox.showErrorAwesomeSnackBar(
                      context, state.message!);
                }
              },
              builder: (BuildContext context, HomeProfileState state) {
                if (state is HomeProfileReadyState) {
                  return Column(
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
                                    icon: FontAwesomeIcons.arrowsRotate,
                                    onPressed: () {
                                      _homeProfileCubit.refreshProfile(
                                          homeProfileRequestModel:
                                              HomeProfileRequestModel(
                                                  email: "F.Taha@diyarme.com",
                                                  lang: LanguageHelper.isAr(
                                                          context)
                                                      ? "a"
                                                      : "e"));
                                    },
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
                        name: state.homeProfileEntity.name ?? "",
                        companyName: state.homeProfileEntity.company?.name ??
                            "Diyaar United Company",
                        socialMedias: state.homeProfileEntity.socialMedia,
                      ),
                      35.heightBox,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: (state.homeProfileEntity.profiles ??
                                    <HomeProfileItemResponseModel>[])
                                .isEmpty
                            ? NoDataWidget()
                            : ProfileCardsListWidget(
                                carouselSliderController:
                                    _carouselSliderController,
                                profiles: state.homeProfileEntity.profiles!
                                    .map((ContactProfileEntity profile) =>
                                        profile)
                                    .toList(),
                              ),
                      ),
                      100.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CustomElevatedButton(
                            onPressed: () {
                              ViewsToolbox.showCustomDialog(
                                  showCloseIcon: true,
                                  dialogContext: context,
                                  widgets: <Widget>[
                                    ViewsToolbox.imageFromBase64String(
                                      state.homeProfileEntity.profiles!
                                          .firstWhere(
                                              (HomeProfileItemResponseModel
                                                      profile) =>
                                                  profile.isDefault!)
                                          .qrData!
                                          .split(",")
                                          .last,
                                    ),
                                  ],
                                  getDialogContext: (BuildContext context) {
                                    _qrContext = context;
                                  });
                            },
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
                  );
                }
                return Container();
              },
            ),
          )),
    );
  }
}
