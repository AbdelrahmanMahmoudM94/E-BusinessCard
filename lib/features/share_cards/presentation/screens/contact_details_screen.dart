import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';

import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/profile/presentation/widgets/profile_card_list_widget.dart';
import 'package:karty/features/profile/presentation/widgets/profile_personal_data_widget.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/share_cards/data/models/request/contact_details_request.dart';
import 'package:karty/features/share_cards/domain/entities/contact_profile_entity.dart';
import 'package:karty/features/share_cards/domain/entities/shard_card_entity.dart';
import 'package:karty/features/share_cards/presentation/cubit/cubit/share_card_cubit.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/background_pattern.dart';
import 'package:karty/features/shared/widgets/custom_elevated_button_widget.dart';

@RoutePage()
class ContactDetailsScreen extends StatefulWidget {
  const ContactDetailsScreen({required this.shareCardEntity});
  final ShareCardEntity shareCardEntity;
  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  ShareCardCubit _shareCardCubit = getIt<ShareCardCubit>();

  late CarouselSliderController _carouselSliderController;

  @override
  void initState() {
    _carouselSliderController = CarouselSliderController();

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      _shareCardCubit.getContactDetails(
          contactDetailsRequestModel: ContactDetailsRequestModel(
              cardEmail: widget.shareCardEntity.email,
              email: "F.Taha@diyarme.com",
              cardProfileId: widget.shareCardEntity.profileId,
              lang: LanguageHelper.isAr(context) ? "a" : "e"));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShareCardCubit>.value(
      value: _shareCardCubit,
      child: BackgroundPattern(
        path: "assets/svg/profile-background.svg",
        patternExtension: PatternExtension.svg,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            50.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            BlocConsumer<ShareCardCubit, ShareCardState>(
              listener: (BuildContext context, ShareCardState state) {
                if (state is ContactDetailsLoadingState) {
                  ViewsToolbox.showLoading();
                } else if (state is ContactDetailsReadyState) {
                  ViewsToolbox.dismissLoading();
                } else if (state is ShareCardErrorState) {
                  ViewsToolbox.dismissLoading();
                }
              },
              builder: (BuildContext context, ShareCardState state) {
                if (state is ContactDetailsReadyState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                          child: ProfilePersonalDataWidget(
                        name: state.contactDetailsEntity.name!,
                        photo: state.contactDetailsEntity.photo,
                        companyName: state.contactDetailsEntity.company!.name!,
                        socialMedias: state.contactDetailsEntity.socialMedia,
                      )),
                      15.heightBox,
                      25.heightBox,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: ProfileCardsListWidget(
                          carouselSliderController: _carouselSliderController,
                          profiles: state.contactDetailsEntity.profiles ??
                              <ContactProfileEntity>[],
                        ),
                      ),
                      150.heightBox,
                      Center(
                        child: CustomElevatedButton(
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
                        ),
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
