// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/login/presentation/screens/login_screen.dart';
import 'package:karty/features/share_cards/domain/entities/social_media_entity.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePersonalDataWidget extends StatelessWidget {
  const ProfilePersonalDataWidget({
    Key? key,
    this.photo,
    this.socialMedias,
    required this.name,
    required this.companyName,
    this.isStatic = false,
  }) : super(key: key);
  final String? photo;
  final String name;
  final String companyName;
  final bool isStatic;
  final List<SocialMediaEntity>? socialMedias;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 50.w,
          backgroundColor: Palette.blue_0DBDFF,
          child: CircleAvatar(
            radius: 48.w,
            backgroundColor: Palette.white,
            child: photo == null
                ? Image.asset(
                    "assets/png/user-default.png",
                    width: 80.w,
                  )
                : Image.asset(
                    "assets/png/user-default.png",
                    width: 80.w,
                  ),
          ),
        ),
        5.heightBox,
        Padding(
          padding: EdgeInsets.only(
              left: LanguageHelper.isEN(context)
                  ? name.length > 26
                      ? 35.w
                      : 0
                  : 0,
              right: LanguageHelper.isAr(context)
                  ? name.length > 26
                      ? 35.w
                      : 0
                  : 0),
          child: AppText(
            text: name,
            style: AppTextStyle.bold_20,
            textAlign: TextAlign.center,
          ),
        ),
        10.heightBox,
        AppText(
          text: companyName,
          style: AppTextStyle.semiBold_15,
          textAlign: TextAlign.center,
          textColor: Palette.blue_014D73,
        ),
        15.heightBox,
        socialMedias == null
            ? Container()
            : isStatic
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/svg/facebook.svg",
                          width: 12.w,
                        ),
                      ),
                      20.widthBox,
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/svg/linked-in.svg",
                          width: 20.w,
                        ),
                      ),
                      20.widthBox,
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/svg/instagram.svg",
                          width: 20.w,
                        ),
                      ),
                      20.widthBox,
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/svg/twitter.svg",
                          width: 20.w,
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: socialMedias!
                        .map((SocialMediaEntity socialMedia) => InkWell(
                              onTap: () async {
                                await _launchUrl(socialMedia.url!);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: ViewsToolbox.imageFromBase64String(
                                    width: 27.w,
                                    socialMedia.icon!.split(",").last),
                              ),
                            ))
                        .toList()),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
